Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32228458649
	for <lists+linux-i2c@lfdr.de>; Sun, 21 Nov 2021 21:23:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232208AbhKUU0O (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 21 Nov 2021 15:26:14 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:38419 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229441AbhKUU0N (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 21 Nov 2021 15:26:13 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 93C00580788;
        Sun, 21 Nov 2021 15:23:07 -0500 (EST)
Received: from imap47 ([10.202.2.97])
  by compute3.internal (MEProxy); Sun, 21 Nov 2021 15:23:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=mime-version:message-id:in-reply-to:references:date:from:to
        :cc:subject:content-type; s=fm3; bh=Lwf/LrY/vE+XfQ2/Z92KIftl2TmX
        RB7ZTlFzeqJGXNQ=; b=XOuHG3LQgih+VPL0zEycQIAQS4SH+cqYCG/qlQPF9YAS
        burGyn8RjULH0IKt+evegCRWlwmUMP41QCoQ1z7yfEkA/qukZ4XE1MPGZsnjXUmi
        FTrumL76+A4D6GbvzI5AnyU0CDB038GbhcjQY1FrOYVibBhmycoDJplGnROL4ouA
        Er28FhLapOt2+qxs6ooo11ePEzzBWo0FlcgXqFFs8XYsfhSQWbrScqb8vmYQhruJ
        UIw6gwCZFsLUxb57jjgUnmTB2QYGyl0pqTl+df1kiJ8jn4ytZ72nk0/uTfbCA+Jt
        uSzY5amJ3U3vPl3C1FLY2VM4u8c/ullKw0DqMP2U9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Lwf/Lr
        Y/vE+XfQ2/Z92KIftl2TmXRB7ZTlFzeqJGXNQ=; b=UJ3HwRgtmw7K+DpeuWDEOx
        rFazcoVi5aZu5uHJF5leS6+/BP4fK+ghav+SelaocCvlzN0cZJV/bDkY3rXrV4ZN
        iRn7fLv9bhh8mRjdKnXDgKYnq1VFZnBu29v/ah8Z06hYWf8Hmv16LFWZIY7eiurm
        SfBq2cry3mCyZi4RQGi4QphIn/wXQlq03LAO9zcTshrkLxyXhfG1cXiqvvL/5C+X
        LzjP157yO7QDBfuFeAY6kZ2DKgSOy4AQVODq4Gal66fmuWbx+QCG7a6H9pICXJh2
        yjA0X7N2Fl+9WbCLn5NdX4sclCpU4/8lN/6XiEXfvD5THcJqs6kz7Uah9nNmAcTg
        ==
X-ME-Sender: <xms:q6qaYUNcT_AofxWkRAiZBJVh5JWEF0j58dmKLGKM_G4XGuQQWHvPYA>
    <xme:q6qaYa-WaA5J_sv4SRcLfhSB0LE_q2qYaKV1b37OKIeUOm0iLDzzEtnNS0i5iPmt4
    dmS8hBFRX2AKoxYRPE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrgedvgddufeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdfuvhgv
    nhcurfgvthgvrhdfuceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtffrrg
    htthgvrhhnpefgieegieffuefhtedtjefgteejteefleefgfefgfdvvddtgffhffduhedv
    feekffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hsvhgvnhesshhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:q6qaYbS6nbxT-X9KYwWt8IiskYv6fJPo7O6I5q3eyEzOEopUU1mWGg>
    <xmx:q6qaYcuiuX_CAawIrVN_AzVO62BBB76-tQ9UByW3gfi5AFBj6LuQzA>
    <xmx:q6qaYcd2tIN1PuwJ5QIW_ma6GBY_NPNC30Pkfyqrq-bOUYYF4Du11g>
    <xmx:q6qaYdVIUtzooA9FK0zaQSKQE-j1rNWxz1SVz5EJLpa7Fu9SvLpz6w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 54102274055F; Sun, 21 Nov 2021 15:23:07 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1371-g2296cc3491-fm-20211109.003-g2296cc34
Mime-Version: 1.0
Message-Id: <2baebbe6-0080-4cff-86de-a00f23aea95e@www.fastmail.com>
In-Reply-To: <20211121171545.27402-3-j@jannau.net>
References: <20211121171545.27402-1-j@jannau.net>
 <20211121171545.27402-3-j@jannau.net>
Date:   Sun, 21 Nov 2021 21:22:47 +0100
From:   "Sven Peter" <sven@svenpeter.dev>
To:     "Janne Grunau" <j@jannau.net>, "Hector Martin" <marcan@marcan.st>,
        "Alyssa Rosenzweig" <alyssa@rosenzweig.io>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Wolfram Sang" <wsa@kernel.org>, "Olof Johansson" <olof@lixom.net>,
        "Arnd Bergmann" <arnd@arndb.de>
Cc:     "Mark Kettenis" <kettenis@openbsd.org>,
        "Rob Herring" <robh@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: i2c: apple,i2c: allow multiple compatibles
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On Sun, Nov 21, 2021, at 18:15, Janne Grunau wrote:
> The intention was to have a SoC-specific and base compatible string
> to allow forward compatibility and SoC specific quirks,
>
> Fixes: df7c4a8c1b47 ("dt-bindings: i2c: Add Apple I2C controller bindings")
> Signed-off-by: Janne Grunau <j@jannau.net>
> Cc: Mark Kettenis <kettenis@openbsd.org>
> ---

Yeah, this should've been "apple,t8103-i2c", "apple,i2c" all along :/
Given that we have no i2c nodes in the dts yet and that this binding was
only added for -rc1 I think it's fine to just drop "apple,t8103-i2c"
here instead of marking it as deprecated and keeping it around forever
if Mark Kettenis also agrees.

>  Documentation/devicetree/bindings/i2c/apple,i2c.yaml | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml 
> b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
> index 22fc8483256f..f1cb96c08212 100644
> --- a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
> @@ -20,9 +20,10 @@ allOf:
> 
>  properties:
>    compatible:
> -    enum:
> -      - apple,t8103-i2c
> -      - apple,i2c
> +    items:
> +      - enum:
> +        - apple,t8103-i2c
> +      - const: apple,i2c

Nit: the enum makes sense once we add t6000-i2c but right now

properties:
  compatible:
    items:
      - const: apple,t8103-i2c
      - const: apple,i2c

also works and look a bit less weird.

Either way,

Reviewed-by: Sven Peter <sven@svenpeter.dev>


Sven
