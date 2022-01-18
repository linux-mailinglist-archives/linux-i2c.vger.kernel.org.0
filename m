Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 457B1492ED7
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jan 2022 21:01:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348980AbiARUAH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jan 2022 15:00:07 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:28460 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1348906AbiARUAG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 18 Jan 2022 15:00:06 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4Jdfks1sfVz6x;
        Tue, 18 Jan 2022 21:00:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1642536005; bh=MrTMnGkpDzEfuLz+3hcoHU389fr0LG1X6fEhjchAE40=;
        h=Date:Subject:From:To:Cc:From;
        b=fNsvPk9PpgJPtaAyq96+dmEPM6aIO705h8YFYlfn14blmoHqKxzDyBAEHM98yeQ1M
         MC+UU4UqWy6v/nMKhI902TEEzHJZuMi5jBp1n/IStJ73RuaAerbjN4p10g81nnfd8J
         f8VnYIPrdEZYFH2pVhAeMR8eIrv9X4ycO20ObDc06Ucu7Hl6cPmyt+LML9QZKevQBi
         OtzKgxDLEIuonlffo4w2fL+RtaQ80oWyML4hpyfsnhKR2AuL75Ycaaxh6z4EU/+sAL
         ioHlSAmPqvQQ2udXwP9P321POGqXIv+ArnPdd+d3OwxkfBIvCeR3EGa3DnXYsurbn8
         ankhhE4OskGDA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.4 at mail
Date:   Tue, 18 Jan 2022 21:00:04 +0100
Message-Id: <cover.1642535860.git.mirq-linux@rere.qmqm.pl>
Subject: [PATCH v2 0/2] i2c: tegra: allow compiling out support for Tegra's special constrollers
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
From:   =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
To:     Dmitry Osipenko <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

To patches that, combined, reduce I2C driver's code by ~2kB and a bit
from runtime overhead for non-Tegra20 or non-Tegra210 builds.

v2: remove KConfig symbols as per Dmitry Osipenko's suggestion.
    This assumes that for relevant SoCs the special controller implementations
    will be used anyway.

Michał Mirosław (2):
  i2c: tegra: allow DVC support to be compiled out
  i2c: tegra: allow VI support to be compiled out

 drivers/i2c/busses/i2c-tegra.c | 35 +++++++++++++++++++++-------------
 1 file changed, 22 insertions(+), 13 deletions(-)

-- 
2.30.2

