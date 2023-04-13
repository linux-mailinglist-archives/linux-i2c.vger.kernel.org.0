Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 197F06E103F
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Apr 2023 16:44:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbjDMOoR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Apr 2023 10:44:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjDMOoJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Apr 2023 10:44:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC4097680
        for <linux-i2c@vger.kernel.org>; Thu, 13 Apr 2023 07:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681397002;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EOEz3AcKRLNIsRiC1VQJ7UUhN+DnVClixWyNnz405l8=;
        b=Dx8b5o2ZMA/0cruZ5beQq815bDxzf0DCB24oASvzX+3qzAW34dGlQ/bxhc7IGnTJuFyg2J
        H6LyvR+zbMW1XnyZlBPib5vStCqFCpwyIDiqfNx32lPDwrrTtYdvKD4OKkBLiMMXc7ZfwY
        1aeQrsXuYlRw0wXkIe1f/iA5ed4Hlu8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-QTNC2kVkMMS4JGdOhRkg3g-1; Thu, 13 Apr 2023 10:43:18 -0400
X-MC-Unique: QTNC2kVkMMS4JGdOhRkg3g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7AFB185A5B1;
        Thu, 13 Apr 2023 14:43:18 +0000 (UTC)
Received: from plouf.local (unknown [10.45.224.142])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5DF5D40B3EDA;
        Thu, 13 Apr 2023 14:43:17 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     gupt21@gmail.com, jikos@kernel.org,
        Louis Morhet <lmorhet@kalrayinc.com>
Cc:     linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <cover.1680602387.git.lmorhet@kalrayinc.com>
References: <cover.1680602387.git.lmorhet@kalrayinc.com>
Subject: Re: [PATCH 0/2] Fixes for the mcp2221 gpiochip get_* calls
Message-Id: <168139699700.841342.7338433386549146014.b4-ty@redhat.com>
Date:   Thu, 13 Apr 2023 16:43:17 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 04 Apr 2023 14:14:58 +0200, Louis Morhet wrote:
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
> 
> [...]

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git (for-6.4/mcp2221), thanks!

[1/2] HID: mcp2221: fix report layout for gpio get
      https://git.kernel.org/hid/hid/c/e36c31f8cac5
[2/2] HID: mcp2221: fix get and get_direction for gpio
      https://git.kernel.org/hid/hid/c/ca6961d8a851

Cheers,
-- 
Benjamin Tissoires <benjamin.tissoires@redhat.com>

