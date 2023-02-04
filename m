Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A451968A9E4
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Feb 2023 14:05:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232230AbjBDNFe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 4 Feb 2023 08:05:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbjBDNFc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 4 Feb 2023 08:05:32 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2577E28846;
        Sat,  4 Feb 2023 05:05:31 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D5BDAB80ABC;
        Sat,  4 Feb 2023 13:05:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16718C433D2;
        Sat,  4 Feb 2023 13:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675515928;
        bh=R4PDFyhXzALhU42OYRxTlSyScyDxwgiQwzTEaL/GtOg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kxNfnUh/+jMB8HmBkQ+FOlEtxcAMyIOi82Q0PX8Q/o9V4RMsdggtiJgSGN7dBuznM
         HDxzVtCkTTUUngwkyQ4ZeYrowP62derk+6azHXEu6VHke5MOjVpjZsHe6ySe+5crFd
         N6kk+6ZLeTu8fEJQHyrzBWIMCtFuXazOZPKDrXFt8xECXCgskWT3hlnuGom4rd1JxK
         5G/PMvxzuBS5vmxG3CNhBu9OgVhFZKfn54wrO2D8GusLriI9IYOrNq2VWJoDyb9pSf
         es4lG3GxjMhD2DtzrOMQbyGBXSTd2T5M/LfGzTWQHePae2JH4Y3V9iZzXnyVIa/68q
         Qv4BRWNHJY6bw==
Date:   Sat, 4 Feb 2023 13:05:12 +0000
From:   Lee Jones <lee@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 resend 2/3] i2c: cht-wc: Add charger-chip info for the
 Lenovo Yoga Tab 3 YT3-X90F
Message-ID: <Y95YCCwtJHtNBtrX@google.com>
References: <20230126153823.22146-1-hdegoede@redhat.com>
 <20230126153823.22146-3-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230126153823.22146-3-hdegoede@redhat.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 26 Jan 2023, Hans de Goede wrote:

> On x86 devices with a CHT Whiskey Cove PMIC the driver for
> the I2C bus coming from the PMIC is responsible for instantiating
> the i2c_client for the charger chip.
> 
> Add the necessary i2c_board_info for this.
> 
> Acked-by: Wolfram Sang <wsa@kernel.org>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/i2c/busses/i2c-cht-wc.c | 46 +++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)

Applied, thanks

-- 
Lee Jones [李琼斯]
