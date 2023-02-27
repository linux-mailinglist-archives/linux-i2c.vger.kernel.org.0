Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 756666A3D2E
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Feb 2023 09:31:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231924AbjB0Ibp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Feb 2023 03:31:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232281AbjB0IbD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Feb 2023 03:31:03 -0500
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5807121954
        for <linux-i2c@vger.kernel.org>; Mon, 27 Feb 2023 00:27:35 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 811CE5C00A1;
        Mon, 27 Feb 2023 03:25:37 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Mon, 27 Feb 2023 03:25:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1677486337; x=1677572737; bh=svd0uO5dr9
        J0uXOzYupOeAmrR1S0dxBbORMn/KaZjsM=; b=at/R361Bn+84H50rwdXQzJQtx7
        p3B9uLZd3zwJpsoHVPqzTlKTV3kzON0XZbjYn7MUlNucN5K9IFh77lPGmX91AIaj
        ARoru8SulFV4PxAGoXkoPgdW3FQZPX1KUmHUzV0KdlY5xABYjBgnJSum3pkf3iUT
        8RzXlUoa/PoMpglmM5Es0Bor4yyVY4PMaoHz9zQB5iLdQ0JpWsUCGXaTZxK4Cy1g
        iN2HbaZhqLLWYtoJasYH8e0e3ZT0qqvF1LO751L/RYg0v/MlOq77rVhb7JxJCUjY
        iqSMdjbAfZ2b3YugcsU5L+jTXmcijN1biN22PMlpFQzST59UvN2rW7maZ7NQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1677486337; x=1677572737; bh=svd0uO5dr9J0uXOzYupOeAmrR1S0
        dxBbORMn/KaZjsM=; b=aqO9FsGG4rqqYewHoRXzUjG9iXCnELOb+8BbqBJ1vtXv
        Af05xZ3mJAj/RA7QU6Y5NtSvLOl4Ig8xV1ko914qfuKjfcFZk8hWSlzAkzaRXDQw
        xmJViTxCfz8GkGooeFX4X6hN9c3xYMK6PfUmFJh8CeCUzMniGJH5xaBWA4cz9Ej4
        3bvzuk6Uil8HbN9oUtFM+LPFUqDh1RfecfKBKy3sncpEe0mztpj5m9nUxLvPGYIX
        fdRZAjPi+9BYjAaDOkAOz02iqJZ60t1KeL+UMA5cyOhHsmlg21Qpj/VQKdlIMKEU
        +y557hrb/KnIMD3g7UojIp7sYJ52oX9+hq4fP9jP5A==
X-ME-Sender: <xms:AGn8Y7O7y25yK_fTxxeBnkfi7ZZhStrL3hY3oX6D0c9NrgjCheeefg>
    <xme:AGn8Y1_ZW8IPLLNpLV9nIdIDs86XmdQEKpZMol77O0u8bjjM-bGMFO5rm5In0m21y
    QLY9HWHNHtCqiWDC7A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekledgudduiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeu
    feehudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:AWn8Y6Q_WwMhHufIc18qSUuN5O5qDglnTpZ9QYLpxAimQr6FgVU6uA>
    <xmx:AWn8Y_vcGpEo0F6IguJX3f2n2Pmyh1P20u-d-ECyIMC3RQikWU3BeQ>
    <xmx:AWn8YzddoYjkieyUGgXhxQlkOORu8Jr8l7MKH4XHXrgSpjbsazCDoA>
    <xmx:AWn8Y7FsVFQqHvT6URLuL5NsATMtuS0P54WzvFkJS37TTVDll_WVUA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id E859CB60086; Mon, 27 Feb 2023 03:25:36 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-172-g9a2dae1853-fm-20230213.001-g9a2dae18
Mime-Version: 1.0
Message-Id: <65eeff1c-3ad0-4cd2-ac79-eb7d940e7170@app.fastmail.com>
In-Reply-To: <20230227035414.1461763-1-bgray@linux.ibm.com>
References: <20230227035414.1461763-1-bgray@linux.ibm.com>
Date:   Mon, 27 Feb 2023 09:25:15 +0100
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Benjamin Gray" <bgray@linux.ibm.com>, linux-i2c@vger.kernel.org
Cc:     "Sven Peter" <sven@svenpeter.dev>,
        "Michael Ellerman" <mpe@ellerman.id.au>
Subject: Re: [PATCH] i2c: Disable I2C_APPLE on PPC when COMPILE_TEST is set
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Feb 27, 2023, at 04:54, Benjamin Gray wrote:
> The ppc64le_allmodconfig sets I2C_PASEMI=y and leaves COMPILE_TEST to
> default to y and I2C_APPLE to default to m, running into a known
> incompatible configuration that breaks the build [1].
>
> Disable the I2C_APPLE build during PPC compile tests to prevent this.
>
> [1]: https://lore.kernel.org/all/202112061809.XT99aPrf-lkp@intel.com
>
> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

This should work, but I find the added dependency is a bit
confusing to readers.

>  drivers/i2c/busses/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index d4975444a32d..3db56e446902 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -896,7 +896,7 @@ config I2C_PASEMI
>
>  config I2C_APPLE
>  	tristate "Apple SMBus platform driver"
> -	depends on ARCH_APPLE || COMPILE_TEST
> +	depends on ARCH_APPLE || (COMPILE_TEST && !PPC)
>  	default ARCH_APPLE

I would add a line such as

      depends on !I2C_PASEMI

which actually still allows building both drivers as loadable
modules but prevents I2C_APPLE=y when I2C_PASEMI=m or
vice versa. For completeness, it might be good to extend
the I2C_PASEMI dependency to include '|| COMPILE_TEST',
which would ensure that any future problems show up on
x86 builds as well, rather than just powerpc.

     Arnd
