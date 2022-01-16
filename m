Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E16348FDDC
	for <lists+linux-i2c@lfdr.de>; Sun, 16 Jan 2022 17:30:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236072AbiAPQaK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 16 Jan 2022 11:30:10 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:63217 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235731AbiAPQ3q (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 16 Jan 2022 11:29:46 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4JcL944DHLz31;
        Sun, 16 Jan 2022 17:29:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1642350584; bh=bGGaw/ldrCq1jAH5EChsBqNxiTNzrIjLK3w+QjVTJCw=;
        h=Resent-From:Resent-Date:Resent-To:Date:From:Subject:To:Cc:From;
        b=Pd2VbWB0znYwxMr/zuvbiSNcckRInObFJiQtiRGqwDj3EA7SODdZgaBDWEpmLQh2A
         r32Jytoo0hFOkKPlS5oktGs6H4MvtCRnrjG5SKPuQZfMFz1QHKGXKbvoDIz8YzB2KT
         OAmcLV09tAc8c1CyWiXGQtrY6uB1nwwwOhvALBTveCDxX30BSU2O4QnKlVvZudEt/o
         O3RV5cV5zmk6wRPiP3MhP+rrbtlzeSfCGSVp0OaJ08XMI3lz6dCq6kX+pAEz0HxKP0
         hJsQFv6g8w7yjPSxfRCVQEtrTcuouKKqTl5P9iK7YiGHn137IUMUYeTZ4veQk5oAI5
         VRirZxQx/XCIA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.4 at mail
X-Spam-Action: marked-ham
X-Bogosity: H 0.000000
Received: from rere.qmqm.pl
        by rere.qmqm.pl with LMTP
        id gCUpJ4tB5GFaKgEAZU03Dg
        (envelope-from <mirq-linux@rere.qmqm.pl>)
        for <mirq-linux@rere.qmqm.pl>; Sun, 16 Jan 2022 17:02:19 +0100
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4JcKYR2wYTz63;
        Sun, 16 Jan 2022 17:02:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1642348939; bh=bGGaw/ldrCq1jAH5EChsBqNxiTNzrIjLK3w+QjVTJCw=;
        h=Date:From:Subject:To:Cc:From;
        b=FBgmvOZ5We0GsAgvaOrgo4c7fgbnPoYnoOImUCCiJsRJ0Iwa9CE7aT+amX8e+RXdS
         y1eOLOJBwpUDUzkIpzNqL2B7eixDqYjsJFvPx5DKxHBWOVGhz946cHyBzuwywLh+ik
         1MNjQ4wr91aom/rgSmqDeNmHN8+Dg4js8LxzapMr/YjzsruxFZBS05mCY3AJKre+r8
         OqLXewNTlPfzcKQ4QCpArFWweFoYQEq+S2swpdM4er4QIg+9YU4hu7IyW/BQDMGoKy
         9Bkpmw50XCnc0lzS9lMT/AH6G6ObSAv8+pXT0TXlnGsA8lA4ciGOxZU05k1GPxtiJ9
         jJQddSTQck9wg==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.4 at mail
Date:   Sun, 16 Jan 2022 17:02:17 +0100
Message-Id: <cover.1642348712.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH 0/2] i2c: tegra: allow compiling out support for Tegra's special constrollers
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Michał Mirosław (2):
  i2c: tegra: allow DVC support to be compiled out
  i2c: tegra: allow VI support to be compiled out

 drivers/i2c/busses/Kconfig     | 16 ++++++++++++++++
 drivers/i2c/busses/i2c-tegra.c | 35 +++++++++++++++++++++-------------
 2 files changed, 38 insertions(+), 13 deletions(-)

-- 
2.30.2

