Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A970C6A8774
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Mar 2023 18:00:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbjCBRAP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Mar 2023 12:00:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230153AbjCBRAN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Mar 2023 12:00:13 -0500
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C772C3771B
        for <linux-i2c@vger.kernel.org>; Thu,  2 Mar 2023 09:00:08 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 7F1B13200B37;
        Thu,  2 Mar 2023 12:00:05 -0500 (EST)
Received: from imap47 ([10.202.2.97])
  by compute5.internal (MEProxy); Thu, 02 Mar 2023 12:00:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=cc:cc:content-type:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm1; t=1677776405; x=
        1677862805; bh=A4DG3njJmXycSDt0EcX4fs+/B/Pusf37CNmQk5n4q74=; b=r
        UbJ6ahcY9YIf8ZpATkv5V1vJHgIhkpA9YUMLbYzQI5/wBRsi5LaasD9QG/AyEre7
        O9LebtRRz+gGkMzLHc7cHwNq9B8EmYrK5EA2j1j9q+zY8JicaRTd8HgsxO6CaxeR
        qTutKmOKObmA2MLqpRSt7XVSxxnFDwE4KDbVuVjNON9qlxqU712UmjwqjD7JkSD7
        08KoeplfKHCTUMd0oOOrXXqs4F3f+8gD/gFw2/cQD1pSLWZ4gcM/B/7OVlSKB7f6
        grBy6DeSaI9QW9XcaP9SRIonh3KrqpZ8A9UQhkNhcTdgA2KSwnqWJre+LhhSUFXV
        LV43db+iQYLe+XpQ5NJOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1677776405; x=1677862805; bh=A4DG3njJmXycS
        Dt0EcX4fs+/B/Pusf37CNmQk5n4q74=; b=RGULKbhrxNWqLMeuVr1i4yi+QZXeE
        Wu6hzy2FRNmk9wBo1jqVfuUx5PnP0CgQBxoUrLUx19GLi2IdyE0jzeOuOtxZgJKK
        T4jN9gxdLEY/VCnSjFl35HTowMbqQdOAhBEkTKmA95uL1BQux3lYmyz+rJqAYaG+
        m2sMTyth/qsjSzHdhUqMEkyV0Fh6fTlNuKyJmm8mWhtglWbxSR+iG52QCsxZN/ON
        E5A0g9LNpzSmLI9INp3N0W+Eew+HmM8zpvQyTZevW1OkwpFfsM2Cw1KIJYBf/DA6
        1vYX7E0fSQRHXcvJAA1I1HdjFdhrR7O1kZhferet5+kIgoB/b1YZDHvxQ==
X-ME-Sender: <xms:FNYAZCby2n4Kr_sOwoEBVa-69gwToEcqa2t5rGu5FjkR_I9XeTh-7A>
    <xme:FNYAZFZaxS-F-kLJM5lRobgRfCaYIderE62cgC43k6dSPgcemwBieP8F6L_SbSCEG
    IaTVDfiLdJN-htLYvI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeljedgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedfufhv
    vghnucfrvghtvghrfdcuoehsvhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrf
    grthhtvghrnhepleevgfegffehvedtieevhfekheeftedtjeetudevieehveevieelgffh
    ieevieeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epshhvvghnsehsvhgvnhhpvghtvghrrdguvghv
X-ME-Proxy: <xmx:FNYAZM8S2Xja-sCbM29cDlJYzJuxAzGe-biliJD2XGEX_e4-3dDfvA>
    <xmx:FNYAZEpoCpnp-WH8x1d1OeqJFo--MoA-VT4VA0lr-nkCEobea84f-g>
    <xmx:FNYAZNqnnA9aoWR6F7ZZ-pjOZxGL_Ob3qQBYfHx3QMAYPxyIlfxDww>
    <xmx:FdYAZOByJlWSSRoz3cOH9FQH063ohb1StJ45aA54TCgTt_0ObTEDJA>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 7C151A6007C; Thu,  2 Mar 2023 12:00:04 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-183-gbf7d00f500-fm-20230220.001-gbf7d00f5
Mime-Version: 1.0
Message-Id: <836167be-6122-426e-bbab-fefd52fd370b@app.fastmail.com>
In-Reply-To: <20230227233318.120415-2-bgray@linux.ibm.com>
References: <20230227233318.120415-1-bgray@linux.ibm.com>
 <20230227233318.120415-2-bgray@linux.ibm.com>
Date:   Thu, 02 Mar 2023 18:00:04 +0100
From:   "Sven Peter" <sven@svenpeter.dev>
To:     "Benjamin Gray" <bgray@linux.ibm.com>, linux-i2c@vger.kernel.org
Cc:     "Arnd Bergmann" <arnd@arndb.de>,
        "Michael Ellerman" <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 2/2] i2c: Build I2C_PASEMI with COMPILE_TEST
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On Tue, Feb 28, 2023, at 00:33, Benjamin Gray wrote:
> This driver builds fine on non-power platforms, so add it to the
> COMPILE_TEST set to increase build coverage.
>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
> ---
>  drivers/i2c/busses/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index c42109e972fe..52b1aa164cda 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -890,7 +890,7 @@ config I2C_OWL
> 
>  config I2C_PASEMI
>  	tristate "PA Semi SMBus interface"
> -	depends on PPC_PASEMI && PCI
> +	depends on (PPC_PASEMI && PCI) || COMPILE_TEST

I think you just want

	depends on PCI
	depends on PPC_PASEMI || COMPILE_TEST

here and then it should work.


Best,

Sven
