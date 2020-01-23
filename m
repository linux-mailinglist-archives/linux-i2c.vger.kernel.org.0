Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16714146CDE
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jan 2020 16:31:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726885AbgAWPba (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Jan 2020 10:31:30 -0500
Received: from ns.iliad.fr ([212.27.33.1]:56996 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726232AbgAWPba (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 23 Jan 2020 10:31:30 -0500
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 23CB5218D8;
        Thu, 23 Jan 2020 16:31:28 +0100 (CET)
Received: from [192.168.108.51] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 0AFC31FF32;
        Thu, 23 Jan 2020 16:31:28 +0100 (CET)
Subject: Re: [PATCH v2 1/2] i2c: Enable compile testing for some of drivers
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Jean Delvare <jdelvare@suse.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        I2C <linux-i2c@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Greg KH <greg@kroah.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <1578384779-15487-1-git-send-email-krzk@kernel.org>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <2ef0dfb9-6f25-29c7-153b-3e4dfa15df8e@free.fr>
Date:   Thu, 23 Jan 2020 16:31:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1578384779-15487-1-git-send-email-krzk@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Thu Jan 23 16:31:28 2020 +0100 (CET)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 07/01/2020 09:12, Krzysztof Kozlowski wrote:

> Some of the I2C bus drivers can be compile tested to increase build
> coverage.  This requires also:
> 1. Adding dependencies on COMMON_CLK for BCM2835 and Meson I2C
>    controllers,
> 2. Adding 'if' conditional to 'default y' so they will not get enabled
>    by default on all other architectures,
> 3. Limiting few compile test options to supported architectures (which
>    provide the readsX()/writesX() primitives).
> 
>  config I2C_BCM_KONA
>  	tristate "BCM Kona I2C adapter"
> -	depends on ARCH_BCM_MOBILE
> -	default y
> +	depends on ARCH_BCM_MOBILE || COMPILE_TEST
> +	default y if ARCH_BCM_MOBILE

Why not the simpler:
default ARCH_BCM_MOBILE

Regards.
