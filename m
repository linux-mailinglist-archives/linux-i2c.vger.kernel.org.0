Return-Path: <linux-i2c+bounces-7977-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D25F9C834B
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Nov 2024 07:41:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2958E1F217FF
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Nov 2024 06:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED2711EABD5;
	Thu, 14 Nov 2024 06:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cjpVhCAP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACC11E9098
	for <linux-i2c@vger.kernel.org>; Thu, 14 Nov 2024 06:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731566452; cv=none; b=pMREY9+h6i6hZ0q9uVVEJchVpKrZUKB59YSFFgVYLNsdI0my+La22Hk8AjPrIbUySpBXYiH9eWuLiwme9nkUBx0ucD2ZxsA7UPvnhsBLb6VphZ4s4jFdI4EX193lrmh3vdKZ6MfXe1ZDuNRdPzjyN+4SnyUSUsBHJh3iz52/6Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731566452; c=relaxed/simple;
	bh=Ie06+zKlb5167khTr6AdZ2HFIFNVRhwCJm/e+4A09Nw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SILsMgRt2+03UMGaUMcPfegznxPXy0b7IUjkUC7Ib63n5gvszsVc0DtF+5WVLgOS4cMD+Ll0Xg8gzxXLaEojXLgiyUkSGJmkKBo2LQfG/HLcLo+Liiy3jY5yb/JSCC8ZqLiPfgAfefPuBpS49Wbbn16I1KLWABpn4aE0kGQFm0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cjpVhCAP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6128EC4CED9;
	Thu, 14 Nov 2024 06:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731566452;
	bh=Ie06+zKlb5167khTr6AdZ2HFIFNVRhwCJm/e+4A09Nw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cjpVhCAP9Ez20ubkjwp0JpI4SQ+7Q/MbutNFvi9M8XxHsKqp3+LI/N46i5SWukESW
	 cqrTavlo53Vg25OcpCfFB8BGp1mc3vNlOTc0k3/bzpNJKz2Rn45anWafjrQH5IsRnt
	 pplXIE/Yy92TSQdWEceART77SMPBbwlb7kFUWa6Th6JrzrtFltVN+nE4sYGIg087/k
	 u3MZSE4hxia8uFSavO2XSOFBMI7Fg70pjpVmA2do+B4NYY6NwhAEVgsakvX6tl8Joa
	 kuiZa/xoxE5L1p/yEae4EDn5YPei+Eo5sXGk2JNn7EadOp70tZsAgKmxlcKdJFygXm
	 Of6Fh0GHFLuEQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B53ED65C46;
	Thu, 14 Nov 2024 06:40:52 +0000 (UTC)
From: Stephen Horvath via B4 Relay <devnull+s.horvath.outlook.com.au@kernel.org>
Date: Thu, 14 Nov 2024 16:37:39 +1000
Subject: [PATCH 5/6] decode-dimms: Add basic decoding of type specific
 information for DDR5
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241114-decode-ddr5-v1-5-0ed2db8ef30f@outlook.com.au>
References: <20241114-decode-ddr5-v1-0-0ed2db8ef30f@outlook.com.au>
In-Reply-To: <20241114-decode-ddr5-v1-0-0ed2db8ef30f@outlook.com.au>
To: linux-i2c@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.de>, 
 Stephen Horvath <s.horvath@outlook.com.au>, 
 Guenter Roeck <linux@roeck-us.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3016;
 i=s.horvath@outlook.com.au; s=2024-05-10; h=from:subject:message-id;
 bh=xmqPimQasKa21RJvUonC9M0tQw4eLI+Xk5I4HAGl3eM=;
 b=owEBbQKS/ZANAwAKAYC8XiInGJ2jAcsmYgBnNZtxuoJg6+JOrWylS9sxKxe+htPek3xI3xmDT
 v4hGbPgBIqJAjMEAAEKAB0WIQTIAeBGYgifSxYwNMiAvF4iJxidowUCZzWbcQAKCRCAvF4iJxid
 o4v2D/9jJ2MDWc5dN9I0CjcQ/IXvJ+tzsS0hADztT/kt9agqKoigVlLPoOFpaXUCuRVlMqqvSCL
 yfIU4Ojw0RvBW7VwC1TFVXBToy1F8jbhY3dUZTuF/RxttfPcirz+ehBLt3LCBKSmDffMuJP7hiR
 r+OVGo4xBDQvoG7RknZn4LW4LY4RQrHLe34aW2kHz4CuIR7lFEoaC71qyOGHRw9nislAwLjAgEx
 abbsb1/3UBs+fJwk6pfSeifycGSIeQC0wDPrjFHKoiwFZu3LjBrLHU1Rw5tRFTprPi0tx5Apu5c
 Qxn476D4LN3MMOEuFg+Vvph0Ui4lDcJbNSYMxa15oHL0jStWjHkVl87XwnHG7m69kDXJqzGCT7+
 Ljev/5HsoA04LCT9tY9OUr+Gnxjhwb71WRHNxfrZiXXGWPtnvbDPdvsfpZebCZlv+eEF+BGn3m7
 vXGPxKvsIOlwKaNWuvgHUFCZcFvkvMFRISqF3iStJ+QvW7zCWZenH+kKEcPHL8ektMRx40T15ZX
 qUNoZ+XMqZmgg5bzB0nU/8I1nSze8A5hSb8B48oks2tjkJHK7vKw+tLbBxbnFjzT1dCvo2FZYW6
 M97od63PNmIF1f2GMMw45tmJRsZoeuTp06i4cWIYZRNSDCHW9dNHL/1pVQKqdTijMbT3fyuO6Ng
 gt7jm1i2FT4zjAw==
X-Developer-Key: i=s.horvath@outlook.com.au; a=openpgp;
 fpr=C801E04662089F4B163034C880BC5E2227189DA3
X-Endpoint-Received: by B4 Relay for s.horvath@outlook.com.au/2024-05-10
 with auth_id=277
X-Original-From: Stephen Horvath <s.horvath@outlook.com.au>
Reply-To: s.horvath@outlook.com.au

From: Stephen Horvath <s.horvath@outlook.com.au>

Decode more manufacturer information, but only the info that is specific
to certain types of DDR5 memory modules. This is completely untested
since my modules don't expose this. I also only have UDIMMs.

Signed-off-by: Stephen Horvath <s.horvath@outlook.com.au>
---
 eeprom/decode-dimms | 71 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/eeprom/decode-dimms b/eeprom/decode-dimms
index f36af056a480d429203abc7e0dfda3751027948b..a3b613bc869bbd1d8183958c42d05c3b3e3653ca 100755
--- a/eeprom/decode-dimms
+++ b/eeprom/decode-dimms
@@ -2386,6 +2386,77 @@ sub decode_ddr5_sdram($)
 			(($bytes->[231] >> 4) & 15) + 1));
 	printl("Module Reference Card",
 		ddr3_reference_card($bytes->[232], $bytes->[232]));
+
+# type-specific settings
+	if ($spd_info_rev == 0x11 &&
+	    ($type == 0x02 || # UDIMM
+	    $type == 0x03 || # SODIMM
+	    $type == 0x05 || # CUDIMM
+	    $type == 0x06)) { # CSODIMM
+		prints("Unbuffered Memory Module");
+
+		printl("Clock driver manufacturer",
+			manufacturer_ddr3($bytes->[240], $bytes->[241]));
+	}
+
+	if ($spd_info_rev == 0x11 &&
+	    ($type == 0x01 || # RDIMM
+	    $type == 0x04)) { # LRDIMM
+		prints("Registered Memory Module");
+
+		printl("Clock driver manufacturer",
+			manufacturer_ddr3($bytes->[240], $bytes->[241]));
+		printl("Data buffer manufacturer",
+			manufacturer_ddr3($bytes->[244], $bytes->[245]));
+	}
+
+	if ($spd_info_rev == 0x11 &&
+	    ($type == 0x07)) { # MRDIMM
+		prints("Multiplexed Rank Memory Module");
+
+		printl("Clock driver manufacturer",
+			manufacturer_ddr3($bytes->[240], $bytes->[241]));
+		printl("Data buffer manufacturer",
+			manufacturer_ddr3($bytes->[244], $bytes->[245]));
+	}
+
+	if ($spd_info_rev == 0x10 &&
+	    ($type == 0x0A)) { # DDIMM
+		prints("Differential Memory Module");
+
+		printl("Memory buffer manufacturer",
+			manufacturer_ddr3($bytes->[240], $bytes->[241]));
+	}
+
+	if ($spd_info_rev == 0x01 &&
+	    ($raw_type & 0xf0 == 0x90)) { # NVDIMM-N
+		prints("Non-Volatile Memory Module");
+
+		printl("Clock driver manufacturer",
+			manufacturer_ddr3($bytes->[240], $bytes->[241]));
+		printl("Data buffer manufacturer",
+			manufacturer_ddr3($bytes->[244], $bytes->[245]));
+	}
+
+	if ($spd_info_rev == 0x10 &&
+	    ($raw_type & 0xf0 == 0xA0)) { # NVDIMM-P
+		prints("Non-Volatile Memory Module");
+
+		printl("Clock driver manufacturer",
+			manufacturer_ddr3($bytes->[240], $bytes->[241]));
+		printl("Data buffer manufacturer",
+			manufacturer_ddr3($bytes->[244], $bytes->[245]));
+	}
+
+	if ($spd_info_rev == 0x10 &&
+	    ($type == 0x08)) { # CAMM2
+		prints("Compression Attached Memory Module");
+
+		printl("Clock driver 0 manufacturer",
+			manufacturer_ddr3($bytes->[240], $bytes->[241]));
+		printl("Clock driver 1 manufacturer",
+			manufacturer_ddr3($bytes->[244], $bytes->[245]));
+	}
 }
 
 # Parameter: EEPROM bytes 0-127 (using 4-5)

-- 
2.45.2



