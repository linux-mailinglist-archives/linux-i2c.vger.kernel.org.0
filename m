Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69D2A3A3D32
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Jun 2021 09:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231316AbhFKHf1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Jun 2021 03:35:27 -0400
Received: from muru.com ([72.249.23.125]:41814 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231289AbhFKHf0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 11 Jun 2021 03:35:26 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 4DF2580BA;
        Fri, 11 Jun 2021 07:33:35 +0000 (UTC)
Date:   Fri, 11 Jun 2021 10:33:23 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H . Peter Anvin" <hpa@zytor.com>, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, x86@kernel.org,
        linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 2/4] ARM: dts: dra7x-evm: Drop "ti,pcf8575"
Message-ID: <YMMRw43TKtXsDoLL@atomide.com>
References: <cover.1622560799.git.geert+renesas@glider.be>
 <f499a261e0b39daca2d761bd600fe362cddab653.1622560799.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f499a261e0b39daca2d761bd600fe362cddab653.1622560799.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

* Geert Uytterhoeven <geert+renesas@glider.be> [210601 18:26]:
> The TI part is equivalent to the NXP part and its compatible value is
> not documented in the DT bindings.  All other users of similar I2C GPIO
> expanders just use the compatible values of the original NXP parts.

Picking this patch into omap-for-v5.14/dt thanks.

Tony
