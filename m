Return-Path: <linux-i2c+bounces-13671-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DBCBF0BE4
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 13:09:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E4CF3A2D6D
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 11:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 559F02F744F;
	Mon, 20 Oct 2025 11:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="LCHscH3T"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1122F617F;
	Mon, 20 Oct 2025 11:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760958572; cv=none; b=GpIL7sZV2geu8O4KtDa9tw/oO61xkSnTSbcVt/SdQjjU/aUk0YnDXUX4lQZIYSX/Dx1YwOSrFjdbFdY1hv+X+53hPrOfTRpMXIpIGdrzGWzsDihayAfaX1W9MlIKQozaC5YXNR9tD7fz/UWy9e7os1q4+4200Td8ltOwlhlZeIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760958572; c=relaxed/simple;
	bh=fk1TO4ZsMehYzUyLbQcVt8MpvDW59sa20REU0KIb31M=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=FigekQXRCqoReDSGAUK0IFqUoowbXWtDULeC+Q/Od2sIrBcywChXDZ2ULlSDQIZfECtOWFbJPZSIROPNzo9zQE15mpDJzrkBlQNyfxU+aUA3NEj0Sw4g19TsdDmyDawyPHzg4EovTK1LlVnBPE6abdpf8TXcOsHS6qNNdcl/sz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=LCHscH3T; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1760958543; x=1761563343; i=markus.elfring@web.de;
	bh=vu16eeWZId9dJlXn77Yis1FTYeIfH23X6y+nOXOhwcY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=LCHscH3TE4dWjYPEYRTo5QY+n2XZf546FSIg5C8OZvCPBsJaS9H6r4r8kiRUE4SQ
	 9zI/hSHxPt91uNliVlyZqZtZ3KYu0qHahlzb0A0O6G2EfCmkuzO3xLKMSvAE5/JHY
	 R+VhvBKVMIwMpJE0kwKkRyBYl0C3MJHr2D/yVn5xlTh8W4PEFRq9lCIw5p0p4vDEm
	 0P5y5zrthiXWzWifubxbKkXiD4OTnRB6f++BkNBNVMqdqxao03Th+8t5D4QmW/Uvw
	 zB+eoMScaJ/2jzgDOkESXzl93BhQOm6ZRcnUYOFkLP9anS3lKAGTJz0N8Qzc6xcsX
	 TB5dXovIo4IsfRjHVw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.235]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MD5jv-1v2JRu0vc9-002VDA; Mon, 20
 Oct 2025 13:09:03 +0200
Message-ID: <bec52694-c755-4d88-aa36-1d96f6d146e4@web.de>
Date: Mon, 20 Oct 2025 13:08:53 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>,
 Jan Dabros <jsd@semihalf.com>, Jarkko Nikula
 <jarkko.nikula@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, Anand Moon <linux.amoon@gmail.com>,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] i2c: designware: Omit a variable reassignment in
 dw_i2c_plat_probe()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:EnEHh+4nkuUmoqHH0gC8zBGCHAjfLGk0oJje0qKEu8Rmr9ZD3LM
 Nfw1fFYBbquS/5lrbItimYj7bhfBDP7JJne/TiVf60K139HKCMUiq/5KfS8fc+rnBSlGFEh
 GeQuWf1ZccG46OtNtdJkpvNttiF6yvl/Sc55AltV4Zsmwj4OaJIek5l/R5pFVS582hmhkcJ
 4WBeRjRn1wd7lrpkIohuA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vgPH6jG1T0s=;6loLz15M1dgwHr0CokK80Lb1u6L
 NW19cfyPbHtbXxygoMGBafNIhbr5+xJkfgf/7/BFjzHceGaFLpSkKz1oh6c6lorTgqpEi4Nc6
 vFTJzxyHkg9tP1gaupDYlOz0kU8lb3NArTyYen1Vfzkg2VQfFGxVQrrBWUUsmKZoNhTdyu4iL
 OcJ2wPNnxHGSGPZAOs8VMYhsnMOLioaLTiVc49q2UZ1xkOFaZP/vKzgeeEDAduoyxAAupYXSs
 7I5QE1Hpno6PXN7JEwQZj52srZOy9X0shXvLzKD8WIjDUVLda3YDkGIBqE33V/XdL/jUyvad0
 7DkxE4QvG1zImNdMsI5ueNmlHFC1vrbaVTLyv0+qUBB17K/9WFf7z3kjSfrFZKYmGKUhnOms6
 e5CYrHXb/AoO9laQ7juk3cXsBDBrcckeg5g8gRfcIed/Hq1lB6Mk+OcKaCx8aMvYLnmL6LapW
 s+efpHNxNiMqLIHK9+xRTm4yfs4ztDGcqMV1/pFQ+UdbsIg+Q42dPrna/osDhzk/IkDAYdgqr
 BN0jgmc8DGSh7TqHcF50D3Q7f+wRRxIoX0z0y9UahJn15rcDvL8ld8YVZjLPlYvByRgtSwaql
 isBNgPmO7bEOKpDXhz/YAEJsRNyMAhWi9R1IOV8dmQ0BQWbE0rf8LvGlcAwueI9ijWxJO3Goi
 JIvl3sqyMqxF/B6/U8LEmV77IaRSjp64i2juwL3H4um+BKvGwik8qPk9wgj9n/LYdu9zs7tP7
 KxuvptsCuIa4U1FwraVrhectM4YNdNh9kIUeLD403NCMj5/jkkMv0aLg3fcSk31bhOseha1cR
 8dAgMYPGyQzzTQYNyH8Bnv1+2gjM+5MpZSJXVlxEp9p3hbQnHiFiEwKQcJmlfX7VocIfcQ+3W
 uXOISgAYndHYsCOiNZRb2n9IzcET2pkK/ufsqSWd1wrpLSk+hApc3ymvmGMmOpLBiS1yULfwi
 BbtqdADr911yQunmVCm23weZEbXDEXKxJvEIWBNAToOp+e6CArgjI7FgqvgGmzgVyHyd/gkdy
 +z+/RAFIx4OOaAJ8P1GzWc0zCwdd5+9cjCmO0EANMtdA4u4KoRf78JBYDMZD1MYU5ITlqjr8h
 ogDXJ+VMKAMJtuuvD3aTaeFwkKLorqJZ/LI241ZbaR5DBeNygyWUdQB4W5IBeOshpQ9bmOsJP
 u08pNGfUUIsW/tBN3yN0fGojzGYWSj3OZfOhgzNT2gUxTDR8aPO98DaaAjZjqxhb4oU8d72FZ
 Z3Gq1sxej0qt3G3J0UPLJzDBY5TaMRresv5kjt7tNSWyzNekpvDdDlrzxutGpOtIy9fy7At+z
 gt6ZGEMDuBW0slYVILbKFeZBAJgvkVIl81MuFq66hfX7CLd4dFtFq6+/Kj9pqs/7MpeVtRyNm
 F0E1TbsGKJiChnA3pgzeGniQ7S1zYH1505b8wWZOQ3Usa1EGE2vtC6zgr8iroPt5+ULoOl63i
 ZVL1i4y50R2sDC175owXsxoiEuEbOmQ5Tn0Ah1eJAxawTB7qMzGRKtY3uxrnxDvn/QqnjazxI
 emYrox6KxvnX9Gdn4i3x8CkoyTnQDEpwO0ZqUVyi5YuY67ZQf80UpEC8gAoODNb062sz8cNMJ
 +vmGqWMrWH98bTCGI7S0J8icXPvcjAzXNq7/nLW7do7JkQj01xr+ixW+1mk9kTpN1Wej6fny0
 LGxmovUweBuTEPbwgAlHbbiq7cg8yTVVfYGAZd/hv7jv9NNNxU/zikjlN890uFo4ET7nnpstG
 Qx4lbHCOPLkCMMAyBL6fI8ykU5pgS811eWWFoCPf57S2oyGR+sx+IoTX7mYkmDhi8AhblHRkq
 xe/aPD4udOA99v5v7T6t19P7iJd9VGc+2CihGYbIAXU/xClIAEV3ZrbrXmybVx7zkRImjkhlu
 syTOQPn87/r4XLe755W/KHfxeUfPDTo+tIbbnnDy1lawcySfGPQbdTDl1LQ/ftL+FJcBsncOa
 iDbkzgODIOKbP8b2p/e0IALbjVLJ0RITAZ/3lOtFvC3ahEZiOuoLUMCxL5x/vWeaUzT1dJdQQ
 qancKAvEMg9ba/DZc/6cDzZXw0MbYS+VRmTKKw9lyAtu+wDw5ffort/zIOCHVDLZ2Vr+xhOCn
 4tAbUelWQpx+jBn7E/P35oNRhcb3Pfbsj8MkCaXJexMEBdrUNUh1E98cLauHhYcwJfvLMJnZl
 dSr2qDfslycC+/rYnNyuVNsVVkVQERigY2gtJ9Rw21VhTDsJH9l2sTlhiAE/0tGhx3Pjl1vjS
 4OxyAGMP0aBoqbhKfV8nH19NnzVZ3x8vQYNJlCq2sAX/i3g9KdNm3VFiGFLqzG2sG8ajleqO8
 SGBg0b+txySN1JfyANyi07IDAuQgBX3cKnZEwZ89UWanKhiRd4T0CBnYRc8f3FeYxr02EEqNa
 W9qjEgQv81RYfIdrfta4UlT5NwJpxNKquojauwrpOyQNhfagJJbwt5H2zYgfszD9rlDJotAjt
 c2Yl/+w2OX8h5y7yn4fjrQ2HeeW5nSeADXIdTGCC79L+sbkwgge50MIyG2FjbJmKzzb+IRAUN
 HijWHXXWQCM66xVmHKUmb5tdxAijt/hOubvopuSKi/ZNEeYfiu8tv5gfZelTwxCdA2NmyyKtd
 +qa9o0RSrUyPPF9jMGQGK4+fwjoBg/kUtThsXw0jE2w42YHx8xPunGYA9Vib8V+1RsY92eZYQ
 krquhSiWcyaj/RnugFUi+p4iu11LwHSmiGZ1+YYf8fPMcxQL26VdxxeQx2UvkhDi94MgbrlrW
 Vubn0ZEAgeQmch0QjNrPtqLY/qiSKL4RvewDEuraVF16XUqczySddxnZdt2sQqcxt2LcdmJYo
 vjxcnswy/Atn9xhzhUy5hEkuWGxHBkpPYaWUB87ZoQ3TGQKm9yzX9VEYQnsgeQzLPsafEM8ED
 WDkqf6QjxSrfF8EoQhYxTFDLvEkI2+voXDDq87DOmO2hIZq+TwcXSzMZEn2jjIkJM2E4rmgT7
 Oba/zFs76xdTPuO5NCfR5mTy1Dv7+AnmpxABVfGkmmJgKz7+lhjGk7yb0er9cdXBFikgR93zf
 j7RnuNdQx3TXrA9pQnfZIFrbvUs+p+1KpWVVGeO+A6vzWX2iupOqlhbs/E7awI20F6DP4YcOO
 v2WhQwj1E15q0kvON7EFGY64QfMcIAXZx3p9M12LfDVoVHeTV5oEXywXSABiXM9DotfPzM3fN
 4AdIMPhfc9t7c4ATlM9XcQhnGfTYF9n/SmxyggVqV4MFQoWag7y+RZKsDTObvu1QW1UmPQ/dd
 qidmRO+RF6oE4L19IftXdvm/zgiJnrGIZ0+kzJsv4aWZ0r2TKtCrkKBWTBarPetx4tr4L7iIl
 qVs+deIVDJBXkpw5XW2TMswHOQh5DEeeNRBO0tUzSK0/YYStdhUhAi2GOv/grBfbULMFs3KtJ
 c9DVfs8udFhNrWxOhyvnnlxFkES3xYyqAw2pI6TfeEgypArO2QhSmqK83CNfzLLLhGEaStQNy
 BIlyEmGHZR8Bs/U+YL64PX8+zCIPIIUDA18QNtnuKyDxOQBD0GiOeZ9MIWnvADZRuyJE4mULF
 DK6pzlcDYB3Cu8OT6L8jx3eSGtyznSjGC5eHno0CG60PivPRsAF6kEb5Rdl93xK0nMHCNGgJn
 sl2OOrqIqpf33nBevb+CY1Thbqp/zar+vG7aFSub7LFMfi0agBfrhtcWOVn0v2paBBJctAQ15
 x3rAnHOUJNHLyzzk7qUu/1tM21AbOtLUIlEMPx3T74rSMXVJBRSPDvIRb8Hyspi9YyWDtRpv5
 qc8767TBhPocQhUilT5DUU/KkOYNl4KowvFtpHYGsmEq/Gbam6lJ3mgX6s9qo7knsuCF2xUnm
 cTuz+/c70qOD25zVktPgUZAyGCjIcQnh+DMpMFBdrsWCP2l+4Y4DfkyiZwG/nBm2lkVDqbzzX
 /JV2BGTQiDxdCcC01GUA80Vhfpj/dIytcZKz6oQxUqCfFIk2WTjpjuK01h0SeVQ0Caw2T8Zdf
 8cNFRZtAKJrTs9NXvfu/w18hYhdpMo9ETS9YuCXBBUVW/I7adiaatHCrgVQwC3qVyIxsQUdF8
 aFMncYN4dpciUTCMCOKStNgd7gTl/Y5FHqmmm7c4spy2a3nlXJphPxy8blPY4n4A6ZiYu3RqZ
 6j2dVrD0aiwAt2s59MRUFw6Unx56zliv4FGUBUC+IBXcl+WTX0xPwQCjv8SMTGSAA8oOFPD7Q
 Cy7YiO4bfMhQ+hOnLCILqYUJctuu+9szv7QrbRVAS5lJtDqTQyCc8Q87CPLEp7FTUaRONdO9p
 /AcPZai9kpXMB7NqZdCojh+/qvPBgfBE6JEesprcXY7d2AlRNWckl2iJ+k9ApNSRcMihOHwEF
 MQb60zv2UDVkEUbUZ7Ho2Ik+11CDCfaxvbdnRiw3fvgguaogzBndlucGKB7oOLlebcADpssG8
 TdYdEtYDPyWncPMWw4lV49YBccWvLD7bT2xpB6fp+rgvK2a0mHxoYupSkKmH2LlLI0Rt7qTen
 jPXREc8Hnvo+49eVH7XOl+BliRTYwTng9rHAZMhfmA45Isw3T3+xrNP62kSnyNjGA564uz+y3
 YVwjQ/wjiqUBWdRy1oMbSHRfXeOAt2zLVGF79EYoEQfq9D5T1aOzOQ0yi8k7DXvepnFFDpMzt
 BzzeiRs7g+3qkC3/FTLDiu2lbVhdTfuAk1VId5AQfwA2fsGxt5SPyE1Nl4Mogfz/er8PDIqbq
 MMjJ3z/3zyW2ATv6MSb4pu+WN/bkkCr1xqu/l6KzxG8KrZEQqujp/0Xzt3ebOPDtInx2ltBcb
 nYJoNgXfQjlaBljKRtGhQVlt1YilBuV/ljduaYsoDIl+6jtoQ2SQd+5bjG9Ey8SIy1+NsSrpa
 HSqE3srvE3SzKVfsKPaAVR6iNaJJr/Av4BAwYdUB8QGl49iHZuAlOcIV64FJizsxAXxarUFXJ
 ziplCVywTQ0t8P8AwuxZ+W8TuUN4RM+O2Dj6KVOEDxt0sKqiis5RPVdjOARfsvzU/l5nQ2+ek
 4rOiwfmbEKx0a89HnAvCjLrxw1WdZwnss4tTHXUA5hEaMZ6LKaX+5BQwtK+WsaJNJPygUhe1G
 QY7Zg==

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 20 Oct 2025 12:56:39 +0200
Subject: [PATCH] i2c: designware: Omit a variable reassignment in dw_i2c_p=
lat_probe()

An error code was assigned to a variable and checked accordingly.
This value was passed to a dev_err_probe() call in an if branch.
This function is documented in the way that the same value is returned.
Thus delete a redundant variable reassignment.

The source code was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/i2c/busses/i2c-designware-platdrv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/bus=
ses/i2c-designware-platdrv.c
index 34d881572351..c69ef8da22ab 100644
=2D-- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -248,7 +248,7 @@ static int dw_i2c_plat_probe(struct platform_device *p=
dev)
=20
 	ret =3D i2c_dw_probe_lock_support(dev);
 	if (ret) {
-		ret =3D dev_err_probe(device, ret, "failed to probe lock support\n");
+		dev_err_probe(device, ret, "failed to probe lock support\n");
 		goto exit_reset;
 	}
=20
=2D-=20
2.51.1


