Return-Path: <linux-i2c+bounces-4667-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 462539292C5
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 13:21:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69E4A1C20F06
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 11:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C87F56BFB5;
	Sat,  6 Jul 2024 11:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="CpjSu7bD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34235589B
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jul 2024 11:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720264890; cv=none; b=GyBuZWD9qdwFDMpU6fQU0S0cupCD6PPbxQS1cjftAWbOCQsDExm8kF/UoB/cnMNo5dlqKV284CG+oZBw/Rmga7NWk/tBJPnG10PEjDFRAgUL0nMiNaLKhHLmnbXJInOiruWhW+MS310JacE2lyg7NnIzqgJYNRknw8ZPrRS2hUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720264890; c=relaxed/simple;
	bh=y5FWZNeQ6JmRQs1l/30Vbm4yrsGahRyVcyvb/wVZIfA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WIIK+8oVEKiuROPdzCEM07TQZ+GhA9+Xe929fYCapBnEC/RCmYrLl82+Iv5hvrD8ahBI6FrDK7r99sPsHRXTgjMEMHB626HFbMMSByrm9QpJyHHDjlQ8CH+ou/bYBwJFXKrEEtCKQPS8uAkWnoM6D0OwfL8rjqKM+JqV0fOJsgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=CpjSu7bD; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=4xGv2GdsCln4go
	c80LSZXUrBL6qxxalWNHk5CsLBJ1w=; b=CpjSu7bDPwZrTYB4DnXqHNJrzzOV0i
	ll8uIcabyZjRJJv8IN4yPeOtXpO4cU3QOhP76TyKvJMMzxzWe7wr6Y8Gfi1EOJAl
	eYaKXSKfSh434zAyHAlKzS3YiYx+9JKmXA5Z4dH8SJCoxnqURGaAyztFVBvyi1yd
	2c/2c5x2P3YnhmZAJ159dGcqaiJS0bS6wqjht7xK0Bj8rjBLCVh+cZ/DSRHm9TfF
	wR6Q+GUBV9AvnC5iTsch/LEkT1PCX7RbFkTTasFpYCXqwNoLS7gYY0t9kNWTlFrw
	SSpGB+37KfH9i4bF3oug8fwFzqzeaLHCrle0xWnEiN2tyJJ+LMS5P9kQ==
Received: (qmail 3809341 invoked from network); 6 Jul 2024 13:21:21 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2024 13:21:21 +0200
X-UD-Smtp-Session: l3s3148p1@BOAqYZIcotJQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ajay Gupta <ajayg@nvidia.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Andrew Lunn <andrew@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	asahi@lists.linux.dev,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Baruch Siach <baruch@tkos.co.il>,
	=?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <bence98@sch.bme.hu>,
	Benson Leung <bleung@chromium.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Chen-Yu Tsai <wens@csie.org>,
	Chris Brandt <chris.brandt@renesas.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	chrome-platform@lists.linux.dev,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Conghui Chen <conghui.chen@intel.com>,
	Eddie James <eajames@linux.ibm.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Hans de Goede <hdegoede@redhat.com>,
	Hans Hu <hanshu@zhaoxin.com>,
	Hector Martin <marcan@marcan.st>,
	Heiko Stuebner <heiko@sntech.de>,
	Jean Delvare <jdelvare@suse.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jochen Friedrich <jochen@scram.de>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	linux-actions@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michael Shych <michaelsh@nvidia.com>,
	openbmc@lists.ozlabs.org,
	Orson Zhai <orsonzhai@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Peter Korsgaard <peter@korsgaard.com>,
	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
	Ray Jui <rjui@broadcom.com>,
	Robert Richter <rric@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Scott Branden <sbranden@broadcom.com>,
	Stefan Roese <sr@denx.de>,
	Sven Peter <sven@svenpeter.dev>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thor Thayer <thor.thayer@linux.intel.com>,
	Till Harbaum <till@harbaum.org>,
	Vadim Pasternak <vadimp@nvidia.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	virtualization@lists.linux.dev,
	Vladimir Zapolskiy <vz@mleia.com>,
	Yicong Yang <yangyicong@hisilicon.com>
Subject: [PATCH v2 00/60] i2c: reword first drivers according to newest specification
Date: Sat,  6 Jul 2024 13:20:00 +0200
Message-ID: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Start changing the wording of the I2C main header wrt. the newest I2C
v7 and SMBus 3.2 specifications and replace "master/slave" with more
appropriate terms. This first step renames the members of struct
i2c_algorithm. Once all in-tree users are converted, the anonymous union
will go away again. All this work will also pave the way for finally
seperating the monolithic header into more fine-grained headers like
"i2c/clients.h" etc. So, this is not a simple renaming-excercise but
also a chance to update the I2C core to recent Linux standards.

Changes since v1:

* changed wording according to the terminology we agreed on and defined
  upstream. That means consistent use of "controller/target", and no
  more "host/client". I added "local/remote target" where necessary.
* added tags which I kept despite some changes in wording. The approach
  and code changes (if necessary) did not change.
* rebased to Andi's for-next branch
* this series only contains patches which convert the drivers fully. If
  all goes well, no more updates for them are needed. The previous
  series converted all users of "master_xfer". But to avoid tons of
  incremental patches to one driver, I will incrementally improve i2c.h
  and see which drivers can be fully converted step-by-step.
* do not mention I3C specs in commit messages, not really relevant here

Please note that I am not super strict with the 80 char limit. And, as
agreed, I did not convert occasions where old terminology is used in
register names or bits etc. or in function names outside of the I2C
realm.

The outcome is that before this series 115 drivers use old terminology,
after this only 54. Hooray.

And a comment to all janitors: Do not convert I2C drivers outside of
drivers/i2c yet. Let us first gain experience here and present the
well-tested results of what we figured out to other maintainers then.
This ensures they have to deal with way less patch revisions.

Thanks and happy hacking!


Wolfram Sang (60):
  i2c: reword i2c_algorithm according to newest specification
  i2c: ali15x3: reword according to newest specification
  i2c: altera: reword according to newest specification
  i2c: au1550: reword according to newest specification
  i2c: bcm-kona: reword according to newest specification
  i2c: bcm2835: reword according to newest specification
  i2c: brcmstb: reword according to newest specification
  i2c: cht-wc: reword according to newest specification
  i2c: cp2615: reword according to newest specification
  i2c: cros-ec-tunnel: reword according to newest specification
  i2c: davinci: reword according to newest specification
  i2c: digicolor: reword according to newest specification
  i2c: diolan-u2c: reword according to newest specification
  i2c: dln2: reword according to newest specification
  i2c: fsi: reword according to newest specification
  i2c: gpio: reword according to newest specification
  i2c: highlander: reword according to newest specification
  i2c: hisi: reword according to newest specification
  i2c: hix5hd2: reword according to newest specification
  i2c: i801: reword according to newest specification
  i2c: ibm_iic: reword according to newest specification
  i2c: iop3xx: reword according to newest specification
  i2c: isch: reword according to newest specification
  i2c: jz4780: reword according to newest specification
  i2c: kempld: reword according to newest specification
  i2c: ljca: reword according to newest specification
  i2c: lpc2k: reword according to newest specification
  i2c: ls2x: reword according to newest specification
  i2c: mlxcpld: reword according to newest specification
  i2c: mpc: reword according to newest specification
  i2c: mt7621: reword according to newest specification
  i2c: mv64xxx: reword according to newest specification
  i2c: ocores: reword according to newest specification
  i2c: octeon: reword according to newest specification
  i2c: opal: reword according to newest specification
  i2c: owl: reword according to newest specification
  i2c: pasemi: reword according to newest specification
  i2c: piix4: reword according to newest specification
  i2c: powermac: reword according to newest specification
  i2c: pxa-pci: reword according to newest specification
  i2c: riic: reword according to newest specification
  i2c: rk3x: reword according to newest specification
  i2c: robotfuzz-osif: reword according to newest specification
  i2c: rzv2m: reword according to newest specification
  i2c: sis5595: reword according to newest specification
  i2c: sprd: reword according to newest specification
  i2c: stm32f4: reword according to newest specification
  i2c: sun6i-p2wi: reword according to newest specification
  i2c: taos-evm: reword according to newest specification
  i2c: tegra-bpmp: reword according to newest specification
  i2c: thunderx-pcidrv: reword according to newest specification
  i2c: tiny-usb: reword according to newest specification
  i2c: uniphier-f: reword according to newest specification
  i2c: uniphier: reword according to newest specification
  i2c: viperboard: reword according to newest specification
  i2c: viai2c: reword according to newest specification
  i2c: nvidia-gpu: reword according to newest specification
  i2c: virtio: reword according to newest specification
  i2c: cpm: reword according to newest specification
  i2c: st: reword according to newest specification

 drivers/i2c/busses/i2c-ali15x3.c         |  2 +-
 drivers/i2c/busses/i2c-altera.c          |  4 +-
 drivers/i2c/busses/i2c-au1550.c          | 15 +++----
 drivers/i2c/busses/i2c-bcm-kona.c        | 13 +++---
 drivers/i2c/busses/i2c-bcm2835.c         | 10 ++---
 drivers/i2c/busses/i2c-brcmstb.c         | 11 +++--
 drivers/i2c/busses/i2c-cht-wc.c          |  8 ++--
 drivers/i2c/busses/i2c-cp2615.c          |  8 ++--
 drivers/i2c/busses/i2c-cpm.c             |  4 +-
 drivers/i2c/busses/i2c-cros-ec-tunnel.c  |  4 +-
 drivers/i2c/busses/i2c-davinci.c         | 17 ++++---
 drivers/i2c/busses/i2c-digicolor.c       |  6 +--
 drivers/i2c/busses/i2c-diolan-u2c.c      |  2 +-
 drivers/i2c/busses/i2c-dln2.c            |  4 +-
 drivers/i2c/busses/i2c-fsi.c             | 56 ++++++++++++------------
 drivers/i2c/busses/i2c-gpio.c            |  8 ++--
 drivers/i2c/busses/i2c-highlander.c      |  2 +-
 drivers/i2c/busses/i2c-hisi.c            |  8 ++--
 drivers/i2c/busses/i2c-hix5hd2.c         |  6 +--
 drivers/i2c/busses/i2c-i801.c            | 12 ++---
 drivers/i2c/busses/i2c-ibm_iic.c         | 27 +++++-------
 drivers/i2c/busses/i2c-iop3xx.c          | 15 +++----
 drivers/i2c/busses/i2c-isch.c            |  2 +-
 drivers/i2c/busses/i2c-jz4780.c          |  4 +-
 drivers/i2c/busses/i2c-kempld.c          |  4 +-
 drivers/i2c/busses/i2c-ljca.c            | 20 ++++-----
 drivers/i2c/busses/i2c-lpc2k.c           | 10 ++---
 drivers/i2c/busses/i2c-ls2x.c            | 11 +++--
 drivers/i2c/busses/i2c-mlxcpld.c         | 14 +++---
 drivers/i2c/busses/i2c-mpc.c             |  4 +-
 drivers/i2c/busses/i2c-mt7621.c          | 26 +++++------
 drivers/i2c/busses/i2c-mv64xxx.c         | 12 ++---
 drivers/i2c/busses/i2c-nvidia-gpu.c      |  7 ++-
 drivers/i2c/busses/i2c-ocores.c          |  8 ++--
 drivers/i2c/busses/i2c-octeon-core.c     |  6 +--
 drivers/i2c/busses/i2c-octeon-core.h     |  4 +-
 drivers/i2c/busses/i2c-octeon-platdrv.c  |  2 +-
 drivers/i2c/busses/i2c-opal.c            | 10 ++---
 drivers/i2c/busses/i2c-owl.c             | 12 ++---
 drivers/i2c/busses/i2c-pasemi-core.c     |  6 +--
 drivers/i2c/busses/i2c-piix4.c           |  2 +-
 drivers/i2c/busses/i2c-powermac.c        | 14 +++---
 drivers/i2c/busses/i2c-pxa-pci.c         |  2 +-
 drivers/i2c/busses/i2c-riic.c            |  8 ++--
 drivers/i2c/busses/i2c-rk3x.c            | 20 ++++-----
 drivers/i2c/busses/i2c-robotfuzz-osif.c  |  4 +-
 drivers/i2c/busses/i2c-rzv2m.c           | 12 ++---
 drivers/i2c/busses/i2c-sis5595.c         |  2 +-
 drivers/i2c/busses/i2c-sprd.c            | 16 +++----
 drivers/i2c/busses/i2c-st.c              |  8 ++--
 drivers/i2c/busses/i2c-stm32f4.c         |  8 ++--
 drivers/i2c/busses/i2c-sun6i-p2wi.c      | 20 ++++-----
 drivers/i2c/busses/i2c-taos-evm.c        |  2 +-
 drivers/i2c/busses/i2c-tegra-bpmp.c      |  4 +-
 drivers/i2c/busses/i2c-thunderx-pcidrv.c |  2 +-
 drivers/i2c/busses/i2c-tiny-usb.c        |  6 +--
 drivers/i2c/busses/i2c-uniphier-f.c      | 26 +++++------
 drivers/i2c/busses/i2c-uniphier.c        | 15 +++----
 drivers/i2c/busses/i2c-viai2c-common.c   |  2 +-
 drivers/i2c/busses/i2c-viai2c-wmt.c      |  8 ++--
 drivers/i2c/busses/i2c-viai2c-zhaoxin.c  | 12 ++---
 drivers/i2c/busses/i2c-viperboard.c      | 10 ++---
 drivers/i2c/busses/i2c-virtio.c          |  2 +-
 include/linux/i2c.h                      | 24 +++++++---
 64 files changed, 313 insertions(+), 320 deletions(-)

-- 
2.43.0


