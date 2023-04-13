Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76EFD6E105D
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Apr 2023 16:50:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230235AbjDMOuD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Apr 2023 10:50:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230293AbjDMOuC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Apr 2023 10:50:02 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BAE8F2
        for <linux-i2c@vger.kernel.org>; Thu, 13 Apr 2023 07:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681397369;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=hbFNJTv0qfkPb9XC0xNSdP4hsv4qoCxGv3/G33VhjFQ=;
        b=Cd8dOmoncYD50h4em9jyjTK9X+FOqVXcFsEro4vg4xVmrjP/2caGim/PKPCJx+AxAcU5N/
        Sc6Yc+S9bj14+uybjsyF2NXxciF7PFkJ0qRb9doPAeiNrPKe4wgimpThDQQwUb+kmrbUCX
        7JSc1cX0RBVyOiSw65sYCZ9Qn1dJP/U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-371-SPOsv6bYN_a5HiGuG7qDcA-1; Thu, 13 Apr 2023 10:49:19 -0400
X-MC-Unique: SPOsv6bYN_a5HiGuG7qDcA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 827D9855304;
        Thu, 13 Apr 2023 14:49:17 +0000 (UTC)
Received: from mail.corp.redhat.com (unknown [10.45.224.142])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 12DF140B3ED9;
        Thu, 13 Apr 2023 14:49:15 +0000 (UTC)
Date:   Thu, 13 Apr 2023 16:49:13 +0200
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Louis Morhet <lmorhet@kalrayinc.com>
Cc:     gupt21@gmail.com, jikos@kernel.org, linux-i2c@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Fixes for the mcp2221 gpiochip get_* calls
Message-ID: <20230413144913.53a22nat4s6i2mib@mail.corp.redhat.com>
References: <cover.1680602387.git.lmorhet@kalrayinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1680602387.git.lmorhet@kalrayinc.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Apr 04 2023, Louis Morhet wrote:
> The mcp2221 HID driver exposes a gpiochip device.
> While gpioset seemed to work fine, gpioget always returned 1 on all 4
> GPIOs of the component (0x01 for input in the field "direction",
> according to the documentation).
> 
> This patch series addresses this issue by fixing the order of the fields
> in the driver's representation of the chip answer, and adding
> consistency to the way the callbacks prepare their command and the way
> the hid event handler gets these fields.
> The set callbacks use a similar mechanism, but work for now because
> setting a direction/value only requires gpio-specific positioning in the
> command preparation, and not in the raw_event handler.

As you should have seen in the automatic replied, I took that series in
because it seems to fix a rather worrying bug.


> 
> The core of this issue being a discrepancy in the way the command and
> the answer fetch their fields of interest, I would also like to ask if
> we should uniformize a bit the way this driver handles gpio, and how.
> I thought about several possible implementations for that:
> Use mcp->gp_idx as the base offset of the gpio for set too, and modify
> the raw_event handler to fetch all relevant data based on that; or set
> the buffers in the mcp structure as unions of the various commands
> handled and use gp_idx simply as the gpio index to access relevant data
> directly from the structured representation everywhere; or go back to ye
> old defines to ensure portability...

Honestly, it's hard to make a choice here. You haven't got a replied
from the other mcp2221 folks in almost 10 days so I am not sure you'll
get feedback directly.

May I suggest that you work on any one of these idea, and then submit a
series? Generally, having the code ready makes it way easier to decide
if this is a good solution or not, while having 3 different vague
suggestions makes it hard to see the implications of them.

Also, just a side note, this driver is very limited in term of scope, as
it only touches one dedicated device. Which means that whatever solution
feels the more elegant to you has a good chance of being accepted :)

Cheers,
Benjamin

> 
> Louis Morhet (2):
>   HID: mcp2221: fix report layout for gpio get
>   HID: mcp2221: fix get and get_direction for gpio
> 
>  drivers/hid/hid-mcp2221.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> -- 
> 2.17.1
> 
> 
> 
> 
> 

