Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 326B857C836
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Jul 2022 11:55:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbiGUJzj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Jul 2022 05:55:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231911AbiGUJzi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Jul 2022 05:55:38 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 178B61F2D3;
        Thu, 21 Jul 2022 02:55:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AAC07B8239B;
        Thu, 21 Jul 2022 09:55:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC504C341C0;
        Thu, 21 Jul 2022 09:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658397334;
        bh=n0AzAmoKf2av80Wtb427rzY8dvn5DDBPRE8jvSLUUQg=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=Ng/k38QzzS2QMLtyvMtKXgQLx9LdlYBfteJzgtClXX3/l0Wmh1KkmI4tNZ7bgQWoh
         WKmAZAVjjSqKXfkehryWpsnXpjjzQFSu2a1LgclW6hA23KP+jKtEfzktDcTi+xcZco
         hNjf9yzz/TTu5xWbtAMCHsQAKsa7YojbqyG+fYS9EhfO83DMEW0js7fM91i9VQSYSG
         qpLtGUgpWXuhAEDQ3//RVSI0MdXb0inZQBNAxEcALF04OgGK9ekszusA9UUKz2OpAp
         C/ec/LGCHrM+7m0sH2Z2/qxWtrFNbx6FpC3v3MEEUquc9tIV8sLRE5e7ApjiHJCVYH
         VehXRKTmClFZw==
Date:   Thu, 21 Jul 2022 11:55:23 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
cc:     dan.carpenter@oracle.com, Rishi Gupta <gupt21@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: mcp2221: prevent a buffer overflow in
 mcp_smbus_write()
In-Reply-To: <20220620162824.58937-1-harshit.m.mogalapalli@oracle.com>
Message-ID: <nycvar.YFH.7.76.2207211154580.19850@cbobk.fhfr.pm>
References: <20220620162824.58937-1-harshit.m.mogalapalli@oracle.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 20 Jun 2022, Harshit Mogalapalli wrote:

> Smatch Warning:
> drivers/hid/hid-mcp2221.c:388 mcp_smbus_write() error: __memcpy()
> '&mcp->txbuf[5]' too small (59 vs 255)
> drivers/hid/hid-mcp2221.c:388 mcp_smbus_write() error: __memcpy() 'buf'
> too small (34 vs 255)
> 
> The 'len' variable can take a value between 0-255 as it can come from
> data->block[0] and it is user data. So add an bound check to prevent a
> buffer overflow in memcpy().
> 
> Fixes: 67a95c21463d ("HID: mcp2221: add usb to i2c-smbus host bridge")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

