Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBD00625811
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Nov 2022 11:21:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233425AbiKKKVR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Nov 2022 05:21:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233528AbiKKKU4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Nov 2022 05:20:56 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6933FCD9;
        Fri, 11 Nov 2022 02:19:35 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0ACEB61F35;
        Fri, 11 Nov 2022 10:19:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FF4EC433C1;
        Fri, 11 Nov 2022 10:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668161974;
        bh=DXhROdy+PjJiSJ7BatXvwLtvxHZ/t1J6Qmp5cL8Yp9k=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=u6gxR/TFfwSONUhno5bia+Plyc06oESwlcVNmVsD8AiQ9dSbAPKb8H1ZUFl8H2tEt
         XY9Qx6EXe8+4kBTAL8rjYtPzh+v6Wa0CvstjlFUstA5t3zWVlB10XNeQ16E94lb81G
         YbT8z9o9rQ63WXXMaykCUN9sIBoWHBN+QC6YejUn5qYixMSoDvuwbPsvPCjGIEvfGD
         t6W2qZV8CQcLhHfG0H7T5dfpGNJbOqHGfpVYOGAUgecU2U5LWZsOPX5y4XpRFfcFAQ
         HfxKpFEE+FyF2wSPEv0DJYYeTDfsXKPUs6DqWjpaALw/JJRqhRtQqIdzx1nAnRjO5f
         zOZbOZh6BJWrA==
Date:   Fri, 11 Nov 2022 11:19:32 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Michael Zaidman <michael.zaidman@gmail.com>
cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org, Enrik.Berkhan@inka.de
Subject: Re: [PATCH v4 00/13] HID: ft260: fixes and performance
 improvements
In-Reply-To: <20221105211151.7094-1-michael.zaidman@gmail.com>
Message-ID: <nycvar.YFH.7.76.2211111109490.6045@cbobk.fhfr.pm>
References: <20221105211151.7094-1-michael.zaidman@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, 5 Nov 2022, Michael Zaidman wrote:

> This patch series is an updated version of this one:
> https://lore.kernel.org/all/20221030203403.4637-1-michael.zaidman@gmail.com/
> 
> Changes since v3:
>   - Fixes for the kernel CI bot warnings
>   - We now do not miss NACK on the wakeup from the power saving mode
>     on the KVM installation reported by Enrik. For details, see
>     https://github.com/MichaelZaidman/hid-ft260/pull/7
> 
> Changes since v2:
> 
>   - Remove SMBus Quick command support
>   - Missed NACK from big i2c read
>   - Wake up device from power saving mode
>   - Fix a NULL pointer dereference in ft260_i2c_write
>   - Missed NACK from busy device
> 
> Changes since v1:
> 
>   - Do not populate hidraw device
>   - Avoid stale read buffer pointer
> 
> Michael Zaidman (13):
>   HID: ft260: ft260_xfer_status routine cleanup
>   HID: ft260: improve i2c write performance
>   HID: ft260: support i2c writes larger than HID report size
>   HID: ft260: support i2c reads greater than HID report size
>   HID: ft260: improve i2c large reads performance
>   HID: ft260: do not populate /dev/hidraw device
>   HID: ft260: skip unexpected HID input reports
>   HID: ft260: remove SMBus Quick command support
>   HID: ft260: missed NACK from big i2c read
>   HID: ft260: wake up device from power saving mode
>   HID: ft260: fix a NULL pointer dereference in ft260_i2c_write
>   HID: ft260: missed NACK from busy device
>   HID: ft260: fix sparse warnings

Hi Michael,

this is now queued in hid.git#for-6.2/ft260.

Thanks,

-- 
Jiri Kosina
SUSE Labs

