Return-Path: <linux-i2c+bounces-15251-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD69D39410
	for <lists+linux-i2c@lfdr.de>; Sun, 18 Jan 2026 11:29:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B6F5301E92F
	for <lists+linux-i2c@lfdr.de>; Sun, 18 Jan 2026 10:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D82730B520;
	Sun, 18 Jan 2026 10:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="lcBHdtvh";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="lcBHdtvh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020093.outbound.protection.outlook.com [52.101.84.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978452DEA67;
	Sun, 18 Jan 2026 10:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.93
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768732164; cv=fail; b=V7brBWkMuc3n5V2OepP8JY1MO2BqQMJxqxk7sIpQ5W0K2EH0YvkK7rrMBLzmgt0vcV2wyDgGcEGQqQW+Kb1iFMekFy6s0LdhaWELubs9T3wvcM0EFDyKja89mvmv1AauQDO3HBNdpbhkO3FAQLkEm3+8EkXOFL9HVq1tT8lQ4S0=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768732164; c=relaxed/simple;
	bh=ekzOWm5Teve3zGoa8DUF+hZwjoTkZ4O4arVHOSwVBl8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=DmmcAv1Naxj0zBziZFZiemz6XFIIYBZMC7QeKP66KpKV9XnqGruZ/lzr8mEgNoSVnswA8LZZzpUYBAXCm9aC0qUJpnyAI/ajZ17uskI5wMMihjfT0RgF73xF36aTvT8wCnJdr4Cr85glyHgbzGvL+jd4xNkJCOW/Bd/oL01TXC8=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=lcBHdtvh; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=lcBHdtvh; arc=fail smtp.client-ip=52.101.84.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=qTQYkzF9zhUM1HgLHDJccuUZlBXlexxPlvnx6xeE/Drhz63ZHycKLvJNuX/oFzk7ldwciNWYbvQ4y0RTbNW+cnLIphyX4FsWgvQmAmL83dKwNRelKi2CJLxFc5L9JVDaRXM5mowxCN6wLjLRiU7C8NBA+yM5WSNs6iupVttFWQ55LwmrrgMAifmJaFENM9SkP2RVKPqyTePCb5vx1E1UuTFMzh7gQbV/amXzCQ83YyKx7bNbj5o5NNBcHlUHEVG59GmOSyY9py6HIl23xYhAwlWEcba5dYh5JghK6Oyz2uepPF51ncqYMdPFS/MmwXkzZbYeVbu18a2F62OajutLEw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W6qlbg8Vu0Yk7H6puhfzAN8IPeodSqQud2vHurd2k4g=;
 b=ifqfQx2PmfWvHC4tjiPpZqSzacw0B0tego9bR0o6SD3fdgOcAVwKgvp8dpZ12FVZfUwwnOzgkLWA7zl0IscJY3l3jN0/qyxI5/7j7hLto2Yakt9CLolpwaVXIMEof0qgNOTn9m6Ujwcj1gJQ7ngAVEhIn6ewalABJ/y5e2hnzqLFLSqkgMHp93ppIKoOmsPJ5gu2dHp4vLy0BS3aghnd2vt/USTU+5/gVhiG0j9Gj/KFRVbZhIPVzyzLhUfSqGTl0uU11N/h+e9KMlwNcviVl66198c+dOF8DP1YkeC75hIc7OKLE67sj+ugn+W/pKO2EcJLv5T7om9JmDWrt0kzEw==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=atomide.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W6qlbg8Vu0Yk7H6puhfzAN8IPeodSqQud2vHurd2k4g=;
 b=lcBHdtvhJg9iY7OBdKq3UuOD4gaj75mWoO7haqiY34lpt9aPR6/2p8V8pd/5d+8U2kR8Y7fp4THART3NVeNw0NAE8rQaFf0D0luMRKzEGjvTB6i4OdHSsf4zZosTayOcSt7j+mnuoCaZHfIvRKkMq6qzmpiCgpBFfFL7xrspqEE=
Received: from AM8P190CA0003.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::8)
 by DBAPR04MB7351.eurprd04.prod.outlook.com (2603:10a6:10:1b2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Sun, 18 Jan
 2026 10:29:20 +0000
Received: from AM2PEPF0001C716.eurprd05.prod.outlook.com
 (2603:10a6:20b:219:cafe::91) by AM8P190CA0003.outlook.office365.com
 (2603:10a6:20b:219::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.10 via Frontend Transport; Sun,
 18 Jan 2026 10:29:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM2PEPF0001C716.mail.protection.outlook.com (10.167.16.186) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.4
 via Frontend Transport; Sun, 18 Jan 2026 10:29:19 +0000
Received: from emails-5811373-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-10.eu-west-1.compute.internal [10.20.6.10])
	by mta-outgoing-dlp-467-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 3790680161;
	Sun, 18 Jan 2026 10:29:19 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1768732159; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=W6qlbg8Vu0Yk7H6puhfzAN8IPeodSqQud2vHurd2k4g=;
 b=NJ50g0VqCVmbBKXkFRa3nK26w0aKlbk2F807yGDorsTdp61x5bEa/s2GnALRXiGcwiF5q
 rvDGZsuCXjnJF0JYy0eU3BXxtR3y7EK0CRHvNJzeQm07vqfGCwScULNlBBtxzr2u5sYZ19Y
 7GL8Aud/0xqzOEaQ0hieiOMeigQo6ao=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1768732159;
 b=bHGSkpHQdvZJ95RK49Kfvt2n3zOT3Xeuj4Qowfn19Eqo0eJ9ql1MRuXk66EDX2BiigCwK
 /iYinjhE+d2vLrZPuZqWlU1MaNMBQwEOCmaZ9Svk50Axlz0UpVZRFMSlehtHGs/fLepSCt+
 NAfxLJcGk/ccQdNy4fYItk9ijLF5sYo=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n1YrMTbuWQ9ULgYQUPRm6dQKIIjEyYRIf5uYTP+dln9fE/st/l2UYq+NKw6fFos8Y5ZY1U9ygNYDJ/Ml5rPl7qGBjvPI+LxqS1UmMlznguamY5qdztCQeJuleI7plESKfJ6JEn1TALPPbHvje+gU6+JpXRt7i+VfJZjo7dDWVnWI5LhjNMKju3PRxELVPrV8OG08E9lK06N2DsAEzBEEhvWlVmIYGvn3kSRmGGYOMFJkMHkd7iaBxZvoKgfzVx8rgpoqtTD7Rj8M9/Z0Eb2jo3rWwsUO29Wwjw80i+eAuqt4Gb+q0l5QnA0Zq/ua0mEAP2oEeueArXv68c1GMyyL8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W6qlbg8Vu0Yk7H6puhfzAN8IPeodSqQud2vHurd2k4g=;
 b=lKhgFxU0OCmamaCGi62rDX5I26/c4hkJ7nsQo95KGNmDN5NWo5GaLBpbwuvPjTq45xnTPNeRWGRF+qbNGMVkl8NwW7mxloVKYi9Oj5cZpZl+y+7VMRpCv+G+6m79K2JVtIKrRLasuB3mEhFEsIe4isSLhXM7mSu3ZrAOhiiuHVWuTJWjyaawc6gjNkQuvOSSQ6i3BH6hq5meuxvGX7k4h8XmdqWYfaiE0YPVuZbe1DMMIgqygE9JGkOfmfIDftHAp7t91Yd8M2dxSn9reeFa+gv/cJjxm1FBGHeWywLDNWoQjgaIjQwCFpyQkNiX5fVR64lssJnz02BqOTifYgbpFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W6qlbg8Vu0Yk7H6puhfzAN8IPeodSqQud2vHurd2k4g=;
 b=lcBHdtvhJg9iY7OBdKq3UuOD4gaj75mWoO7haqiY34lpt9aPR6/2p8V8pd/5d+8U2kR8Y7fp4THART3NVeNw0NAE8rQaFf0D0luMRKzEGjvTB6i4OdHSsf4zZosTayOcSt7j+mnuoCaZHfIvRKkMq6qzmpiCgpBFfFL7xrspqEE=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by GV2PR04MB12189.eurprd04.prod.outlook.com (2603:10a6:150:33a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Sun, 18 Jan
 2026 10:29:09 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9520.005; Sun, 18 Jan 2026
 10:29:09 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sun, 18 Jan 2026 12:28:57 +0200
Subject: [PATCH v5 1/7] phy: can-transceiver: rename temporary helper
 function to avoid conflict
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-rz-sdio-mux-v5-1-3c37e8872683@solid-run.com>
References: <20260118-rz-sdio-mux-v5-0-3c37e8872683@solid-run.com>
In-Reply-To: <20260118-rz-sdio-mux-v5-0-3c37e8872683@solid-run.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
 Vincent Mailhol <mailhol@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Peter Rosin <peda@axentia.se>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Vignesh R <vigneshr@ti.com>,
 Andi Shyti <andi.shyti@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Yazan Shhady <yazan.shhady@solid-run.com>,
 Jon Nettleton <jon@solid-run.com>,
 Mikhail Anikin <mikhail.anikin@solid-run.com>, linux-can@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: TL0P290CA0009.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:5::6)
 To PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR04MB8749:EE_|GV2PR04MB12189:EE_|AM2PEPF0001C716:EE_|DBAPR04MB7351:EE_
X-MS-Office365-Filtering-Correlation-Id: 68e1ddb8-aaf7-484d-fa17-08de567c7085
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?QUw3VEtzcCtFK0g1SVlpMkJVM081TTRtcng4L0kreUNKYlN4ckl4bGNXVzdQ?=
 =?utf-8?B?QkxwWCtDa0NJS0Nzam1pdVNORU16Rjd3NGdsRnVzUVZqbTVTMTYzMXdodWV2?=
 =?utf-8?B?S05NYTlVamludGRjNEQ1Q1JOY2ZYZ2swS1J1aWFCZSs4ZGQ3N2Z0ZkNCMkxJ?=
 =?utf-8?B?bVBycXRCUUFvSmdlT0FzM1p4Y3liM1ZlWXpkZkJtZzVkMGxWc2JRRXhWbXNY?=
 =?utf-8?B?ODA0Ym1BY3NjOUxZeFhETnJ6N1o5SU5VallidlNDTWwzdWZPM2JWRkFrcTdQ?=
 =?utf-8?B?LzNYL1VsdXc3eHE1WkNYdU1NbXV5MWxLb1UzaWgra3NxNjhYN1dwSitHOEhl?=
 =?utf-8?B?aWcrUUMzNEt5aTBQRFo0YlZXNlpRV05kNyt1SGVFK0pvM2I5Z3c4UlVVakFy?=
 =?utf-8?B?dEI1dUdjY2lRb3J3aHV1bER1VXVOTW1RZmVmM0ZEVXVZWmQ2YWZOS1RYWFJZ?=
 =?utf-8?B?N0dqd0NIZVZRMlBQTWFZUklxOGFBSmVESnViZWhKTVJhNE5GcHM5ZGdpT1hh?=
 =?utf-8?B?NHRtL1FUeDRGSXAvbEhLK1dwYTZPWU5BYmhqOXdHSGZrUDVNWG8xUUhkNG93?=
 =?utf-8?B?VHk3QkF5NlRpZnNWWmtRNno4enRWK0dVQW5FeVZieDAxdXZMTTZmSm12dXFN?=
 =?utf-8?B?b0NCRXpqUTNlQm1iS2x5QmNXZEg0bGRGMndBTlVwbmJTRjl3V3BMSXR5NUli?=
 =?utf-8?B?SllDVjljUUJxNFpNaGV5NHU2OUp2ekhLa3liUkxmaEN1YWdwUTB2a2x2RlZV?=
 =?utf-8?B?b21mWlhVVmxyWVVjTVdWWXFIR3B2VmZMWEorRnU0NE90bHc5c3dBVnNTYVhX?=
 =?utf-8?B?TzVMcG91Ri9ITGpYSkc0b0V6dWFRaWUxZGU1Sjd3UDZVaDFHaENxUHhGZVpS?=
 =?utf-8?B?R2RzTDRKSHpubm5lMjdvNFdGTnNDd2Rwank4YzJKK0NuZDA5ZTRNS1czTG44?=
 =?utf-8?B?OTF6MS83VlVwOHdsMjFmUFdXWC90cmpFTThkOHZLQkw0UFFkRkoyRm9MVWdM?=
 =?utf-8?B?WTZBejZYcWRPdEdkWGNPZEY2MW54cktHQVNtTlh1UHA0bXJTM2xCQ1NSK0gv?=
 =?utf-8?B?VGxzci85ZFBmSTNqVFR4ajFHTEF1d2FwUlZzN3Z6Y0tIWWkwMTREcmxFdDBw?=
 =?utf-8?B?WGlmVGYxcUNtSThvdkg2UXZldG1ydDRlbG9XelZiY3JBc0J3SUtyeHdkNWps?=
 =?utf-8?B?YjFqRGxWb2ZXVVM0d1BHRnU4ajhTaFNZZlE3MSt1SkgzaExzWEZQNGZxNnBR?=
 =?utf-8?B?NnRSVlF2bitzeGk3UFVYOTUwS1BjdDNBb1lMLzNMMHllS2VWZTNVYTkzS2dv?=
 =?utf-8?B?RmI1c1lqL2d6YndvOGNUQ3hiRXlJSXA5dm4wdWhCTnJhSXZxUjFlZnFRMml0?=
 =?utf-8?B?MjN3MFJWdWVkUGQ2VS9GK2dzaSsydVNPTXV1bFRLc3Bxa252ekdRRkZIbC9X?=
 =?utf-8?B?UXp3d1ZxNDJsdC9kbE45NmFJK1JWRHBVdk56bEw4bXJ3YmVlejJRZHFCbHh5?=
 =?utf-8?B?VVJmajI4cmo2WE9zdUVaMnZQQmpRZUFITGpiV05SVStXSTVobnd2UW81S3FY?=
 =?utf-8?B?QXRGZ1BBdW9ENCt4U2pIWjZmQ2l6dXBFckJqSEJEYWRuMyt6TE9xNzduMC9x?=
 =?utf-8?B?TncxUExrSHV0bTYvUEpSRjN2Kzlaa3JYU08rcmdCU2dBcDlxcGVURnRjeXVC?=
 =?utf-8?B?ekRBeUNJbWwwaHNKQ3FWN0VKTmFlNkZFOGlhVi94TzFGc2hoVjU1cGtNeWdz?=
 =?utf-8?B?NDRhZ05hV3BkLzBrRHIvZUYwb3BHN0ZrOThEdE4zbkF3bE9DRUJLbHJIdENI?=
 =?utf-8?B?UjIvSzJsZzNXY2JXd25JdThHYnlIbEhXbkt1d3FVVnI0UFJxVzlvNVJTYldV?=
 =?utf-8?B?VlN5TGE5dHY0TWZ4eEdEODNtdVoxNllpTHNRNFhJRlliOVlud0hjTDlzUGpH?=
 =?utf-8?B?VVN5TXhiWEc0SDI4eUcrQ1ZESlBHL001V0RINDl6ZEtnNG5JSXNkRXVpb2g5?=
 =?utf-8?B?ekhJWUVKUnA4LzV4K29mQzZadEN0c1NQTFhPN3UwN0RnaUdFbGt5TWZnclNO?=
 =?utf-8?B?VDdOWXdqcithNXlqY29FVmtSaFdwR2c1R3VvVHlhMTRGNk5sUnFyWVNvREZG?=
 =?utf-8?B?TFFIaVFNTWppL3hYbCtKQlp0VkMyU1ZPY2pMM3oyYm1IZ05odnZJQmhLN29X?=
 =?utf-8?Q?+8p/VQw0dS6eA85jaKhHTjIFCLuZ6iBGqCLptYy31WZO?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12189
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: f1d7f2815192475a84eae79a74344b99:solidrun,office365_emails,sent,inline:10be8686da63a4de695eb0fd74d4d4ae
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C716.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cd844296-2a03-49e5-de56-08de567c6a50
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|14060799003|36860700013|35042699022|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VnFLRlJpcXpwSXRGNlNUZFVuWUJwendXOWs3SjQ1dTRLb21kcTBET3VCK3U1?=
 =?utf-8?B?UVRhNzdRMVAwTVhjM1hVZWs2VFBCOVZQZ092TStlVkFhZUthei9MNEFwK1o3?=
 =?utf-8?B?Qmt1WG5vdFJJbnVHTkZCajh3RGNQNFd1MXVpK3lyNERNSEExNER1dmphVXRO?=
 =?utf-8?B?Yjc4WHJRa1NHc3lUeHY0WGFicEN0YkVmcVBFU2R3QjJ1VG1XbElwNk52TnQz?=
 =?utf-8?B?NWRiQnBLSHo2YXF5cGsyajFMNVhaaDR6RUFqbUxISWtRYzh2eVdDaDkycWZm?=
 =?utf-8?B?cjNTMWlaT1BXU29JTjZET2piOHRDTjY2M0xtc1QxaFN2NDBoOGpUNm9lRzli?=
 =?utf-8?B?c1M2VnJoSDdSZWw1cEUzWXFmZ2lPcExBU1ZKZkRKOFpLOU41eTVVMzVRZkNO?=
 =?utf-8?B?NjhueUo4ODBYNWZZaWZzbHZXYmV2dDgzWWdQUnYrb0ZtM0lQekVObEl1enN4?=
 =?utf-8?B?aTZidDN4N3gvSmhVWktEaURiMEJvT2lvQTMrTjVwb1laS05YTWNjZGpnRWo4?=
 =?utf-8?B?ZllCeUpGYnFBaHQrV0JFNitnK28yMGN2Z0Ixd21RODh5YkFJRUFxKzJFazJ5?=
 =?utf-8?B?cm91NjJrOEZjb1BoSEdPY2ZKRm5kYUc1WnJNUjBqQWJoSHNCbFVObVRDdVNl?=
 =?utf-8?B?aVBNTURoZy80SE1La05tK1A4QjNvWURKN2hjRnRTM2QySXIxcTQ3QS9NVHdR?=
 =?utf-8?B?bHZweWM4ODlxd0RaSDdzVUVzYTNSd1k4TTMzU1NYVCtzQUthMzIyc0ZBbExR?=
 =?utf-8?B?a05NVDIzSmJ5OEpISTIvbEt4ZDFGYmlKdFJlT2MvbW1kS3FWMnUzNlJ2dEdM?=
 =?utf-8?B?bkN5MUdHTWFmZ3FGNXc1NThjV3J6WGNCd3ZrcjBWRmkzV1FienBycTNDYzgz?=
 =?utf-8?B?d2VnbVpOc2tZT0JDbG5COTlQWHJnb0xVVXgyV2p6V29wbUhIbllZUkNSTGlu?=
 =?utf-8?B?Vk9CZFZPY2FFOHdQSnRqbHZ5MGx1YVdvL0xoeEZESlJjbUpHTXNIdDlFSXow?=
 =?utf-8?B?eS9KcTEzNHcrc1JkRDFwMDJIUlpFT0dJRUhHRjdya1RTTGV2dENSMFkvZUw0?=
 =?utf-8?B?TnAzVkp2TGEyR3l5OVlGQ2twK3JnMTZuUEtDNXI4VlZ3cjZMd2ltRzhvcTZS?=
 =?utf-8?B?S2plaDkyTTRudTU1TFBqQkJ6QUJnbDBUb2E1YjE2RmJ0MmZyZ0g2c2w3MldD?=
 =?utf-8?B?UWlHejgwbXMvVGlseFY1RVVsVC9KS0g0L3JuSlRJWlhLNUNCcjRkenl3SkJt?=
 =?utf-8?B?NnA0V1g0MUkrSzBRbUd1L2lZeHhUeDFheWdpWHIzNHdKKzRTem1vK1Fqaks0?=
 =?utf-8?B?TXljcmRBWjM0L09Na3FDZWZic1dKeTA2czdKWXdxNjdVS0dCWVVEZ1hpTHBx?=
 =?utf-8?B?Z2dQb00zRHMxcUx3RlZjb200T3dGRFEwMkdGL2JDQzJRV1VYWUh3eGhXWHha?=
 =?utf-8?B?YStTQUxDSW9FazBsZitVNmNNY1kyV0xIUEkrbTNZdVBtMkNSMU5iZnFWeGdP?=
 =?utf-8?B?RXVaQ1I0dHo1a3NGeDNEbGNEVHI2aElhcVBFeHpMYzgrN0NvYytlQ3F4bXQ1?=
 =?utf-8?B?eVFYaWJTbURORGxxNVArVG9Xb3ZRT2hzWEVPZ3ZBc0txVjRhNWh2b0M3anFu?=
 =?utf-8?B?NFRBREdjN09SSXZtRVR0cFJ4REVFTFJ6cWROdm1sU0ZxNVU3TE82TnpoelJK?=
 =?utf-8?B?MDN0YUpMaTdKc29wNXcwa0o4YXpYMlRkbklqNjFHeG5MT1M0NWc2RC9ONllS?=
 =?utf-8?B?WmRZSjVweFg4K1pKN0piTEQ5U1Vsc0pLRGNmRE9xbkdxZk5QcU1ZSndNOHNG?=
 =?utf-8?B?blZEcHZuckJQRktWYUxiOUFmRU4zc2c2MGxGdXJ4Y1BCWFpBU1lyczJUZFdS?=
 =?utf-8?B?MW1XQXV6WWRhdnJaYmptbmdlRysxMEd3OEtZNDY5TWMxOFBsYkpQbUFtMTlp?=
 =?utf-8?B?aTlWblN6K3E2SnVZcmVRRjFMTlRnRGRNTEdoZ3YyV2F0ejlMNVNoMjUzQ0hE?=
 =?utf-8?B?WUh5U1NvTUM1d1dzZFlBSWdhWXBEek0waEFROURLcVZSVHdaakxoOTNXK2Zi?=
 =?utf-8?B?VEdsOWZHYzFTV2x1THp0QmN0bUxVTlJlZUZqRVJXay9yTFhKNUdlZGEwamIv?=
 =?utf-8?B?aWZRYTN0ZlRIZlRwNXJvQ2pubTc1ME5BcFdRQXZaMW5LOTFPbmVKQVNYbWU3?=
 =?utf-8?B?aktqeWwySVZ2a0ZhMXpOenNJcy9KYWRJY3lKVWNBcWhLbTUveHd3MDJpYVpy?=
 =?utf-8?Q?7kONMH6MYcAlxzKgRukdn2O4K8S6ZF4nVGIB8vDeOE=3D?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(14060799003)(36860700013)(35042699022)(1800799024)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2026 10:29:19.5929
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68e1ddb8-aaf7-484d-fa17-08de567c7085
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C716.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7351

Rename the temporary devm_mux_state_get_optional function to avoid
conflict with upcoming implementation in multiplexer subsystem.

Acked-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 drivers/phy/phy-can-transceiver.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/phy-can-transceiver.c b/drivers/phy/phy-can-transceiver.c
index 330356706ad7..81591d247128 100644
--- a/drivers/phy/phy-can-transceiver.c
+++ b/drivers/phy/phy-can-transceiver.c
@@ -128,7 +128,7 @@ MODULE_DEVICE_TABLE(of, can_transceiver_phy_ids);
 
 /* Temporary wrapper until the multiplexer subsystem supports optional muxes */
 static inline struct mux_state *
-devm_mux_state_get_optional(struct device *dev, const char *mux_name)
+temp_devm_mux_state_get_optional(struct device *dev, const char *mux_name)
 {
 	if (!of_property_present(dev->of_node, "mux-states"))
 		return NULL;
@@ -183,7 +183,7 @@ static int can_transceiver_phy_probe(struct platform_device *pdev)
 	priv->num_ch = num_ch;
 	platform_set_drvdata(pdev, priv);
 
-	mux_state = devm_mux_state_get_optional(dev, NULL);
+	mux_state = temp_devm_mux_state_get_optional(dev, NULL);
 	if (IS_ERR(mux_state))
 		return PTR_ERR(mux_state);
 

-- 
2.43.0



