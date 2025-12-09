Return-Path: <linux-i2c+bounces-14479-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3066CB050E
	for <lists+linux-i2c@lfdr.de>; Tue, 09 Dec 2025 15:44:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 491073048DB0
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Dec 2025 14:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A4F72FE075;
	Tue,  9 Dec 2025 14:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="teYdwf/X"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D2E2EAB80;
	Tue,  9 Dec 2025 14:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765291415; cv=none; b=MDx+QPFLawUGkWQ3RePjGRjcI94HxRodrG6I6Fa8AvdvfXjuAaZzoYYOdZYHw38/9DioJYmgarkxCAOWF2o715I+3OKcBESazveC8Ix1WjjdCv4Up2CEd6Hf4VqDU+ucFlcNRsf7WmKo89y8V4/dz8u7ctwljVdhkPMcVYaPWbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765291415; c=relaxed/simple;
	bh=t6hRA0RKU3gz75iHRtYbIcEqKd2SeEmXFKpIbcyF8pc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=udczOR0DRv6EhXYzvm7fmb7AQNabPY+ihfxPmRms0LctGaE0u9h/5rrPu170t/ufPqrB115R8XfTc8WA7ftHoPQnoRO7q43AslvvEOurfHlvSYSUc0jLJasaHcZTuWXSfZHpXBVXfXkVOxr9p+0HZkNGZgJsaURgFSLOXejZT3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=teYdwf/X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6641BC4CEF5;
	Tue,  9 Dec 2025 14:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765291414;
	bh=t6hRA0RKU3gz75iHRtYbIcEqKd2SeEmXFKpIbcyF8pc=;
	h=Date:From:To:Cc:Subject:From;
	b=teYdwf/XMSKiVJFla44U3ZqO8NpiG5AK7K8tnk+cZPC2KdLX/bjXQq+w5swG6H4cZ
	 u1Cxwnys5/vajMyCtt1CSMSTSBzLpAfypMzDKP1SAt+2uuVOGaelayDoRlKto6U2a5
	 1Cs5dWKWY6JV2OToXA3HMBIftJqFCmaaPTbQGNYtAMmoHTlWk+QLUNZNgyKWzy/yyC
	 IzuqCNjmx7eA4UfYTbG4nHRDXOoa0jp4ct/iGM5BY539c2lVlk47Pjk3/eugwqhhDb
	 c9WrcYeKssGZ1pI9dr5iIDTgd2zKFL0llT0zXiu2zJbapTxc2ekgzQDZxf9G7jdTZE
	 zzy64zolQdZQw==
Date: Tue, 9 Dec 2025 23:43:31 +0900
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.19-rc1
Message-ID: <aTg1k4C4uGKMoiUG@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s+MMVg22/Hm8yBUk"
Content-Disposition: inline


--s+MMVg22/Hm8yBUk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

this is a rather small pull request from I2C, and a
not-optimally-prepared-one as I will admit right away. This cycle was
troublesome for us. Despite the usual overload, both (Andi and I)
were/are travelling with limited net access, had serious GPG problems
(Andi; kind of sorted out by now with the help from Konstantin), and
also some miscommunication between us. This is why a few patches ended
up in our trees later than optimal. Because they are fixes which could
also show up in for-rc2 pull request, I hope this is okay. That all
being said, there is really only easy stuff in here. And we strive to be
on track again for the next cycle.

Please pull.

   Wolfram


The following changes since commit e9a6fb0bcdd7609be6969112f3fbfcce3b1d4a7c:

  Linux 6.18-rc5 (2025-11-09 15:10:19 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.19-rc1

for you to fetch changes up to d202341d9b0c5b5965787061ba0d10daafb9d6c5:

  i2c: qcom-cci: Add msm8953 compatible (2025-12-08 20:21:31 +0900)

----------------------------------------------------------------
i2c-for-6.19-rc1

- general cleanups in bcm2835, designware, pcf8584, and stm32
- amd-mp2: fix device refcount
- designware: avoid interrupt storms caused by bad firmware
- spacemit: fix device detection failures
- new devices: Intel Diamond Rapids, Rockchip RK3506, Qualcomm Kaanapali
  and MSM8953
- minor fixes to i801, core documentation, elektor Kconfig dependencies

at24 updates:
- add new compatible for Belling BL24S64

----------------------------------------------------------------
Brian Masney (1):
      i2c: busses: bcm2835: convert from round_rate() to determine_rate()

Cezar Chiru (5):
      i2c: pcf8584: Remove debug macros from i2c-algo-pcf.c
      i2c: pcf8584: Fix do not use assignment inside if conditional
      i2c: pcf8584: Move 'ret' variable inside for loop, goto out if ret < 0.
      i2c: pcf8584: Make pcf_doAddress() function void
      i2c: pcf8584: Change pcf_doAdress() to pcf_send_address()

Hangxiang Ma (1):
      dt-bindings: i2c: qcom-cci: Document Kaanapali compatible

Heikki Krogerus (1):
      i2c: i801: Fix the Intel Diamond Rapids features

Heiko Stuebner (1):
      dt-bindings: i2c: i2c-rk3x: Add compatible string for RK3506

Jinhui Guo (1):
      i2c: designware: Disable SMBus interrupts to prevent storms from mis-configured firmware

Luca Weiss (3):
      dt-bindings: eeprom: at24: Add compatible for Belling BL24S64
      dt-bindings: i2c: qcom-cci: Document msm8953 compatible
      i2c: qcom-cci: Add msm8953 compatible

Ma Ke (1):
      i2c: amd-mp2: fix reference leak in MP2 PCI device

Magnus Lindholm (1):
      i2c: i2c-elektor: Allow building on SMP kernels

Markus Elfring (2):
      i2c: designware: Omit a variable reassignment in dw_i2c_plat_probe()
      i2c: stm32: Omit two variable reassignments in stm32_i2c_dma_request()

Nathan Chancellor (1):
      i2c: designware: Remove i2c_dw_remove_lock_support()

Randy Dunlap (1):
      i2c: i2c.h: fix a bad kernel-doc line

Troy Mitchell (1):
      i2c: spacemit: fix detect issue

Wolfram Sang (2):
      Merge tag 'at24-updates-for-v6.19-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux into i2c/for-mergewindow
      Merge tag 'i2c-host-6.19-v2' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-mergewindow

Zeng Guang (1):
      i2c: i801: Add support for Intel Diamond Rapids


with much appreciated quality assurance from
----------------------------------------------------------------
Anand Moon (1):
      (Rev.) i2c: designware: Omit a variable reassignment in dw_i2c_plat_probe()

Andy Shevchenko (1):
      (Rev.) i2c: designware: Disable SMBus interrupts to prevent storms from mis-configured firmware

Aurelien Jarno (2):
      (Test) i2c: spacemit: fix detect issue
      (Rev.) i2c: spacemit: fix detect issue

Bjorn Helgaas (1):
      (Rev.) i2c: designware: Remove i2c_dw_remove_lock_support()

Dmitry Baryshkov (1):
      (Rev.) i2c: qcom-cci: Add msm8953 compatible

Kees Cook (1):
      (Rev.) i2c: designware: Remove i2c_dw_remove_lock_support()

Krzysztof Kozlowski (2):
      (Rev.) dt-bindings: i2c: qcom-cci: Document Kaanapali compatible
      (Rev.) dt-bindings: i2c: qcom-cci: Document msm8953 compatible

Loic Poulain (2):
      (Rev.) i2c: qcom-cci: Add msm8953 compatible
      (Rev.) dt-bindings: i2c: qcom-cci: Document Kaanapali compatible

Mario Limonciello (AMD) (1):
      (Rev.) i2c: designware: Remove i2c_dw_remove_lock_support()

Michael Opdenacker (1):
      (Test) i2c: spacemit: fix detect issue

 Documentation/devicetree/bindings/eeprom/at24.yaml |   1 +
 .../devicetree/bindings/i2c/i2c-rk3x.yaml          |   1 +
 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |   4 +
 Documentation/i2c/busses/i2c-i801.rst              |   1 +
 drivers/i2c/algos/i2c-algo-pcf.c                   | 105 +++++----------------
 drivers/i2c/busses/Kconfig                         |   3 +-
 drivers/i2c/busses/i2c-amd-mp2-pci.c               |   5 +-
 drivers/i2c/busses/i2c-bcm2835.c                   |  12 ++-
 drivers/i2c/busses/i2c-designware-core.h           |   2 +-
 drivers/i2c/busses/i2c-designware-master.c         |   7 ++
 drivers/i2c/busses/i2c-designware-platdrv.c        |  13 +--
 drivers/i2c/busses/i2c-i801.c                      |   3 +
 drivers/i2c/busses/i2c-k1.c                        |  19 ++--
 drivers/i2c/busses/i2c-qcom-cci.c                  |  46 +++++++++
 drivers/i2c/busses/i2c-stm32.c                     |   7 +-
 include/uapi/linux/i2c.h                           |   2 +-
 16 files changed, 120 insertions(+), 111 deletions(-)

--s+MMVg22/Hm8yBUk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmk4NZMACgkQFA3kzBSg
Kba0tA//Whfvno7+5iMhjv5Zni9EewLZTWZd2FCWdx5wpuG+0HVby6Ywtug8lX4z
MBTZ6TVksKsYBDO4+I7GLEAB40yJmw0DksPKrhYUncabE6jtk8cDTRW6pFXOTsUW
G4YWKj7ODIQ57IkNJURQd5mV0UxbZPiEqQnxi5s2ajnT93TqZlcRSF2VQz3VC+we
SbqdiqE0m8reC23TXon/BR3kx7ia5023S4aqQUzi88Dmn5OuwXYUy9gD8mn3Ed3D
pAboCUQX0i2ajKdGmBLQJdjnTEu49BR2PtK1uTQVhSq6LNdbQvkcPNTMpOlYmACU
rbMe4FlG+91Yw3vfXbRxVXk0CJ/nZhWdSf5CrxaNLjxocPMyN66hD6dXBkXSpTEh
DO1qYlG8wTi2cPJw4Ldzv2dbdQDWqHn+wrYHS25LTAStjzOGLO0eKFGDcOjzqXvr
70vKgbWzEmZKVjF2RbJ9k/oI/utzzKw/MO9YQrjAbdVCQYOPkTez/iAzybQzd6Wg
HEn4hr6fTcKi3OmakrWEv08+yDT+UcN83rCFI5imlSCWfoASEcwwps+D7LTelNiy
m1hkkDbHuwQYbj9TbOqCoKgMhjyqMsRsb2K8KC5CKQu2J9CE70B7+9sLWBjRVrJ4
9HBuYvByGHcfH30NcbVmX7OzCSkNFNRYJtXQ9XdN7dEbwm+Fom8=
=vQHF
-----END PGP SIGNATURE-----

--s+MMVg22/Hm8yBUk--

