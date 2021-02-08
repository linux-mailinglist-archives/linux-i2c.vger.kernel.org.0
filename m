Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DA38312AC9
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Feb 2021 07:36:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbhBHGfy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Feb 2021 01:35:54 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:44705 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229690AbhBHGfJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Feb 2021 01:35:09 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 26CEF5C0106;
        Mon,  8 Feb 2021 01:34:03 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 08 Feb 2021 01:34:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=/
        ybGaTY76afBnZh3bF4DPB4zLOtSDzBx5MCqNoC0b0Y=; b=O9Uxy1mtugv7R7w1C
        +J0kHzFWJ1DfmR+3k8gcTMlaxJB9Co82hO7B5AtbVZe814mXQ9r2rTvqfUvM1D8j
        OcTZTZ3pwFDvlg83S26ABjh7MFOrDRdBlopgmZlYNCV5638eNOXROYD2hj88OWvh
        GXpO0lUGFPnI5QsBFAG8+2neYQEsMkn0aM3v1iPk1qqaBY1vyM+4xgpSB2iyWk+s
        O/o3NXGlJ35PJsymYu0P2f+GIT71+4uqWFTPxIbZLjlEAN8R/5bQ4o6p0E//tdLX
        kvJPesiK7hZRvpx5zBF7t5sGw2ECvyr0LWGtJlzTce7GhCoppcWycIW6Csi4TfM2
        5PBPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=/ybGaTY76afBnZh3bF4DPB4zLOtSDzBx5MCqNoC0b
        0Y=; b=obCf0htaWyBWfWcHJQW+ZSa5hrCZedVhYm+/c+zXoAJeNYX0UimMzyHJB
        xq0xWGpHh08JUfYcFHpNmoUFRocxlf3Nb5rXp8+8pM41JtzTdbWzpty8j3D8im2T
        lqRjhjY0mB7K0hVJUDYcq5h7jpSHZNlBdRYhc5nNCSrBZWl8PMn2vfi4GQrapb6x
        eb5hSC4kFBnohE/o+B0yXtwKT1t0nR+IMs5xtRbFLIDmIu80gyk3vhOafDrSSv+I
        l6S7MAyeUYMADadh3vjRTRcJxVKFIrCJlvarO45b3PRzu+o0nkcSlAqInTm5wKeW
        FY5HreLe+Jex009DZ4zUWq1xigQtA==
X-ME-Sender: <xms:WtsgYLuI-hEEQ9nKuEYkCYBaMIyvWvzWZBt73k72Ip-HiWJMSV2o2Q>
    <xme:WtsgYMdV3jxlGWod2IQ2WPpw_sABQny7PeIf60hOaLDCN4aOp1l8O3BHS8yOVliod
    SHHC1FK5O76P6T78A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrhedvgdelhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpefgveffteelheffjeeukedvkedviedtheevgeefkeehueeiieeuteeu
    gfettdeggeenucfkphepjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
    ugdrohhrgh
X-ME-Proxy: <xmx:W9sgYOynj0hIU_Ep5jCbRSabN8hMyVaGIYJ6P2F1LXKpjy_dryJoIA>
    <xmx:W9sgYKPze7B7WdJb31IcGEtadMi3yRVm__55eR-0azjMbcpVI2SNpw>
    <xmx:W9sgYL_yMrLqT3SEmdZrsivcdFPl_0kNRbonFZZxfrMhBUbQvHfdBg>
    <xmx:W9sgYILadl7tetRuz1nuR0JeI4RYfd3ZNmvk573iPgSDK_tXe1tO_A>
Received: from [70.135.148.151] (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id CCF7824005B;
        Mon,  8 Feb 2021 01:34:02 -0500 (EST)
Subject: Re: [bug report] i2c: mv64xxx: Add runtime PM support
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-i2c@vger.kernel.org
References: <YBq2Fa+crJUXGIU4@mwanda>
From:   Samuel Holland <samuel@sholland.org>
Message-ID: <58b67a52-2e06-d6d4-97b1-b618cf551352@sholland.org>
Date:   Mon, 8 Feb 2021 00:34:02 -0600
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <YBq2Fa+crJUXGIU4@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2/3/21 8:41 AM, Dan Carpenter wrote:
> Hello Samuel Holland,
> 
> The patch e5c02cf54154: "i2c: mv64xxx: Add runtime PM support" from
> Jan 3, 2021, leads to the following static checker warning:
> 
> 	drivers/i2c/busses/i2c-mv64xxx.c:816 mv64xxx_of_config()
> 	warn: 'drv_data->clk' isn't an ERR_PTR
> 
> drivers/i2c/busses/i2c-mv64xxx.c
>    803  static int
>    804  mv64xxx_of_config(struct mv64xxx_i2c_data *drv_data,
>    805                    struct device *dev)
>    806  {
>    807          const struct of_device_id *device;
>    808          struct device_node *np = dev->of_node;
>    809          u32 bus_freq, tclk;
>    810          int rc = 0;
>    811  
>    812          /* CLK is mandatory when using DT to describe the i2c bus. We
>    813           * need to know tclk in order to calculate bus clock
>    814           * factors.
>    815           */
>    816          if (IS_ERR(drv_data->clk)) {
> 
> This check used to be correct, but now if it's an error pointer in probe
> then we set it to NULL.
> 
>    817                  rc = -ENODEV;
>    818                  goto out;
>    819          }
>    820          tclk = clk_get_rate(drv_data->clk);
> 
> The result is that "tclk" is zero.  So probably the correct fix is to
> change the IS_ERR() check to a NULL check?  zero rate seems useless.

Yes, that looks like the correct fix. I sent a patch.

Thank you!
Samuel

>    821  
>    822          if (of_property_read_u32(np, "clock-frequency", &bus_freq))
>    823                  bus_freq = I2C_MAX_STANDARD_MODE_FREQ; /* 100kHz by default */
>    824  
>    825          if (of_device_is_compatible(np, "allwinner,sun4i-a10-i2c") ||
>    826              of_device_is_compatible(np, "allwinner,sun6i-a31-i2c"))
>    827                  drv_data->clk_n_base_0 = true;
>    828  
>    829          if (!mv64xxx_find_baud_factors(drv_data, bus_freq, tclk)) {
>    830                  rc = -EINVAL;
>    831                  goto out;
>    832          }
>    833  
> 
> regards,
> dan carpenter
> 

