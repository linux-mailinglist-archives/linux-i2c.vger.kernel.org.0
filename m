Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44BBD223FC9
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Jul 2020 17:40:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727919AbgGQPkC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Jul 2020 11:40:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:58844 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726256AbgGQPkC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 17 Jul 2020 11:40:02 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D94742076A;
        Fri, 17 Jul 2020 15:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595000401;
        bh=oUWXy3XEEdACj4VXB3S0A8gloCT8UAGtaaANZlTOhcY=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=egmxPzhCJaO5Pklo2wFUgCisrdBaL7j2ncVrgoys66Ov9LXhgVzxXGFqIlODz/BYm
         SBeDYsmknwq4gkwP74D2/j5goaQrPlJbtdJY2ErVv8nPqEDRjP6D+aAJZpnM8njnoZ
         FRAkq9i/JLIztXRgN6hLt6p5JYwLKxyZ+Mt0PWp4=
Date:   Fri, 17 Jul 2020 16:39:50 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Jens Axboe <axboe@kernel.dk>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Vinod Koul <vkoul@kernel.org>,
        Niklas <niklas.soderlund@ragnatech.se>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-pci@vger.kernel.org,
        linux-media@vger.kernel.org, linux-ide@vger.kernel.org
In-Reply-To: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 00/20] Add support for SATA/PCIe/USB2[3]/VIN/CSI on R8A774E1
Message-Id: <159500037996.27597.9512992990495217445.b4-ty@kernel.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 16 Jul 2020 18:18:15 +0100, Lad Prabhakar wrote:
> This patch series adds support for the following peripherals on RZ/G2H SoC
>  * PCIe
>  * SATA
>  * USB2
>  * USB3
>  * Audio
>  * VIN
>  * CSI
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] dt-bindings: sound: renesas, rsnd: Document r8a774e1 bindings
      commit: 92e37407811b98a7eb54eb6a6b3d65847a46e0e6

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
