Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42995459B11
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Nov 2021 05:28:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233129AbhKWEbD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Nov 2021 23:31:03 -0500
Received: from marcansoft.com ([212.63.210.85]:42774 "EHLO mail.marcansoft.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229947AbhKWEbD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 22 Nov 2021 23:31:03 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: marcan@marcan.st)
        by mail.marcansoft.com (Postfix) with ESMTPSA id 2BE98423AD;
        Tue, 23 Nov 2021 04:27:50 +0000 (UTC)
Subject: Re: [PATCH v2 0/3] Apple Arm patform device tree and bindings fixes
To:     Janne Grunau <j@jannau.net>, Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Rob Herring <robh+dt@kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        Mark Kettenis <kettenis@openbsd.org>,
        Olof Johansson <olof@lixom.net>, Wolfram Sang <wsa@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211122222440.21177-1-j@jannau.net>
From:   Hector Martin <marcan@marcan.st>
Message-ID: <7fbd7380-3738-e270-30d7-2d235a80fa8a@marcan.st>
Date:   Tue, 23 Nov 2021 13:27:48 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211122222440.21177-1-j@jannau.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 23/11/2021 07.24, Janne Grunau wrote:
> Hej All,
> 
> this series fixes small issues in the device tree bindings and files
> for the Apple Arm platform in v5.16-rc1. The fixes are non-critical
> but make things easier moving forward.
> 
> Changes since v1:
>   - replaced single value enum in apple,i2c.yaml with const
>   - added Sven Peter's Reviewed-by tags to Patch 2 and 3
> 
> thanks
> Janne
> 
> The series is available as branch at
> https://github.com/jannau/linux/tree/apple_m1/dt-fixes-for-5.16_v2
> 
> Janne Grunau (3):
>    arm64: dts: apple: change ethernet0 device type to ethernet
>    dt-bindings: i2c: apple,i2c: allow multiple compatibles
>    arm64: dts: apple: add #interrupt-cells property to pinctrl nodes
> 
>   Documentation/devicetree/bindings/i2c/apple,i2c.yaml | 8 ++++----
>   arch/arm64/boot/dts/apple/t8103-j274.dts             | 2 +-
>   arch/arm64/boot/dts/apple/t8103.dtsi                 | 4 ++++
>   3 files changed, 9 insertions(+), 5 deletions(-)
> 

Acked-by: Hector Martin <marcan@marcan.st>

Thanks! I'll apply this to asahi-soc once Rob acks the binding change.

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub
