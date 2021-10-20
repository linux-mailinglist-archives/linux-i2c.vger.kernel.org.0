Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9B69434A0B
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Oct 2021 13:29:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230167AbhJTLbL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Oct 2021 07:31:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:53434 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230160AbhJTLbJ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 20 Oct 2021 07:31:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5EDA461212;
        Wed, 20 Oct 2021 11:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634729335;
        bh=42x4PGFADwvGZVixkPIeVrvSgoB8AbaatJsgOjYBdaY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TL2dMFoRvijHDYElQPdlK+1K7gKue66cm65gZaQx1vGycZKBN8QdTj/pl3tF7vRKR
         sVHcafdxdsArYF6ZfS4IXFbjvavunQ0SopwTuvyN7zuXi37wB68nb/hB6C19X2zy2A
         BZ5SUlBbYBXaCx1jf2B0r8u3WKNw+zPa7lQIOQw0oQumRwQq/85Pr37sIyECZ0QVMP
         GjnPVy2GgZZ1FQL5NgXSFGdcvSgjVCn/P06lRmupfzuWCXNxltAc5RjH0AQKi4yMV3
         O0Bke+0MF6igIKzlzuCLFBl/DVEAp5rWs0LHlhcJNFuTLbmjQf+mzhN4X3aXhba59p
         q+KIU5DOzoPPw==
From:   Mark Brown <broonie@kernel.org>
To:     Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
        Liam Girdwood <lgirdwood@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>, alsa-devel@alsa-project.org,
        kernel@pengutronix.de, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] sound: soc: tlv320aic32x4: Make aic32x4_remove() return void
Date:   Wed, 20 Oct 2021 12:28:38 +0100
Message-Id: <163472931363.2896549.12018108884717517601.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211015071113.2795767-1-u.kleine-koenig@pengutronix.de>
References: <20211015071113.2795767-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 15 Oct 2021 09:11:13 +0200, Uwe Kleine-König wrote:
> Up to now aic32x4_remove() returns zero unconditionally. Make it return
> void instead which makes it easier to see in the callers that there is
> no error to handle.
> 
> Also the return value of i2c and spi remove callbacks is ignored anyway.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] sound: soc: tlv320aic32x4: Make aic32x4_remove() return void
      commit: 0f884099a57516c0f1b66aa29e03b9265b242fff

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
