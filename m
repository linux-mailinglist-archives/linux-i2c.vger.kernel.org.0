Return-Path: <linux-i2c+bounces-3978-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F781903B15
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2024 13:51:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7156A1C22CFB
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2024 11:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEDAF17D8AB;
	Tue, 11 Jun 2024 11:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="Itd3BEoW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2097.outbound.protection.outlook.com [40.107.22.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A9C17CA16;
	Tue, 11 Jun 2024 11:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718106285; cv=fail; b=WlNVGjFXQ7nuruAxO3n5tly+hV30mvx9iuSlbdvS7cP5Bph+rnHcX63Gsbcso2v1uXVRwc3+ymiEelrek6k1KEIUm7LbonRaOW87+JLssWHYuvunHIHKMzl5VlYuWdGphAz/aHjV+suNqeca5iZPNACnbiE1eexdPB6Dg4obxQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718106285; c=relaxed/simple;
	bh=zf31fsPc+ejLzxXrCAK6u9pJqrI0f27LctCLqZ9aV1U=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=lqmTlGP3+r1k9eaPbad46i2nlW5ertXtst/Y9rKUGw9mId2kVeiUguiiYF6FQQZKuotSXvRabkP6M8IGx2YbFI3SdP3dbR+iq1R6yBLk8/Erxfjt3Z+VQp+aMMKwN4ENOzmhydiW2fkNli4PJ3nlti+ukGefXd9qNKJ80L0Pyms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=Itd3BEoW; arc=fail smtp.client-ip=40.107.22.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mCmt61iTfjyROrRe2dEs01j1GSUzZhpch62MeLNkU/0kZEhoP/rRKKdd/xfqLgqdeMgq7+glv3218GLIGNb66ubagYPVlcvVEGr7vbTa7xzwuXW78pl5HPaWSMnEHpqmQGmlZgpyjGR2w79v7CSxAKl0NTtFyft2CthGH1FmxJHk7VK77GfQff85w/HcnbqKGbKWeuRQlzFZC66CJXkqwX4E1q8okPYC0LW3uDR6ibonn/t/LPLYRM5OgNvpuB3uL96hND1yhOsxSWZ9i69JSpYzjDRlfgRnshA7TprG4UqdtqYY6sQgogzIrQ6W8hqHYubmYvk/f16u0dj1SN6LKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+YOMp5PxtEIH32WPrIdAw5ibx7RIknJ01VIcy1JYLmg=;
 b=QlpzMpBnZOW8fkZpcDMGBg9wGc2jxuSJks/Sgc2LRVOfpe8vzIzJUK/C5mkNURtCq+PgAqOQdbOMX706wtECwf5QrrraO9LGFOg4lMGFBuazGNrYXW7Q+rMdFAVS3+dB3BdOYU+pZkMU8hReOWDnewKzGi8hYz2WmZNARkIs+jgMKI7WZA/tDwcbok6qj5k1pIONhSOVge69d33OYhyabviMdVyctj9OXR8CUt0/yikrfqk1ep8sF2y0pxOhHUt5a12Mn03dz5gscTBvbPgGlZSjl/Z/ClzCKtExqMYsDXWdyryicj9yoAkmUgCpe3tZ6UoSH2adjFBn+aeX7MKHWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+YOMp5PxtEIH32WPrIdAw5ibx7RIknJ01VIcy1JYLmg=;
 b=Itd3BEoW8CSnNxwYcTAmR8DC48I9xulHvkW3wLj1PGkkdM9b3tQDcy9zJTq6uUtNXWkXj2rI0eDx+byVVPMQryI0nHKGd9vSsjeBHj6H1r9+sdDDV+hS8xNGg6+4Ja5Al1vJQK28EbD+p2FFuIKOMrBaxZhWlRTZlG14rsHtvjc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com (2603:10a6:803:122::31)
 by GVXPR04MB10301.eurprd04.prod.outlook.com (2603:10a6:150:1dd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 11:44:34 +0000
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::2a24:328:711:5cd6]) by VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::2a24:328:711:5cd6%5]) with mapi id 15.20.7633.036; Tue, 11 Jun 2024
 11:44:34 +0000
From: Farouk Bouabid <farouk.bouabid@cherry.de>
Date: Tue, 11 Jun 2024 13:43:58 +0200
Subject: [PATCH v3 7/7] arm64: dts: rockchip: add mule i2c mux (0x18) on
 rk3588-jaguar
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240611-dev-mule-i2c-mux-v3-7-08d26a28e001@cherry.de>
References: <20240611-dev-mule-i2c-mux-v3-0-08d26a28e001@cherry.de>
In-Reply-To: <20240611-dev-mule-i2c-mux-v3-0-08d26a28e001@cherry.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Farouk Bouabid <farouk.bouabid@cherry.de>, 
 Quentin Schulz <quentin.schulz@cherry.de>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.13.0
X-ClientProxiedBy: VI1PR0902CA0050.eurprd09.prod.outlook.com
 (2603:10a6:802:1::39) To VE1PR04MB6382.eurprd04.prod.outlook.com
 (2603:10a6:803:122::31)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6382:EE_|GVXPR04MB10301:EE_
X-MS-Office365-Filtering-Correlation-Id: a65233ff-df6d-4f97-08b8-08dc8a0bdcf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|52116005|1800799015|376005|7416005|366007|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QlgxbmFEMmlzUko3NmE3Tm5aMWtsU1VYY01YaWVGaUlTMUFrNmFEUFdPdVEv?=
 =?utf-8?B?ZFQ4bDJsRDh0d2lNbU1ackhybVFXWmN5YWhkdzZiakxVbUZndGFRRGhITzdu?=
 =?utf-8?B?NWZsK2hKYnJGeDNoek9oNVNCUUJjYTF6YWt2OGJLRGlrZjZhR3VObktJRFNv?=
 =?utf-8?B?eVhLckoxWDhTODg2cEhHQ0VYNllMaURhSUw2ZmhLMmduUkNKWTcybi9MTWJ5?=
 =?utf-8?B?MXpqN3ZOWkNSemRFWk9iWWYxdEpoa3pSdldYRmhMU3ErRHNSOWU1c1MwWnhl?=
 =?utf-8?B?UXdCV1JMUWdVeitYYnV3TDRZYUNOL2dlbmUyY3RhODIrSGhXK0NMZG00c2Er?=
 =?utf-8?B?alhITEt0ZlNjeDZVN0ZENC80QWN4R3pwQnp0aGVwWHJVbEprWGlnR0UremJL?=
 =?utf-8?B?TVYwT1hqSXRRcHNMKytSY2xWTXlEczhWTGlmZm9IdzNLTnZUVkFJYWFjSEpQ?=
 =?utf-8?B?bTBOZGpzL0tzUUQ3OEc3bnZSYUk4MDFrREQvUDlLaHA4MXV2WlJBek0yd1NE?=
 =?utf-8?B?RytreWJiUWE4bEJ6VXRvVHhmbUpRcUVNcE9Xd1ZkODhSaC9aWVhHd0I2NFg0?=
 =?utf-8?B?dU9WbmFuaGZmSjYvZmRqRzZEa0FleVpPbkYxbHhRRWNwOVF4UmRqOGtrRS9k?=
 =?utf-8?B?K082TVJMOFJGUFMrNjl5RjlLaExoZG84Lzd0TlM5NGJoU25MUXpKWlZUZ1pY?=
 =?utf-8?B?TWFwa2JHa08xVFFkeUZBZUZabXpCQXQrdmx1YUk3WlZYMThxN2M4ajc2L2g4?=
 =?utf-8?B?Q3doZ0Y3OWlmcC8rSWpaT29PMURCb2ZzZmhxeVc4cVUrNDF4UVdEbDcvV2hy?=
 =?utf-8?B?dnZhRXFRdHQ0c21hbXUyQXNFVkp5bUsxOERLMVhwUjFiVjJEcGQxNk53MWNh?=
 =?utf-8?B?WS9RdHJ0QzZIUldQS1pJWjRLZkY0VjJvVFdXM2VMbU1LcldNSmYvTmtJRjJC?=
 =?utf-8?B?SW56S3lQQTZXY3JOd1RKZVljS1FyUVBLMHd0R3dUT3NnYkZ5WkxkQTNTaS85?=
 =?utf-8?B?R3M5WEgraXVkUzdUbjZJbDdBODFlUFB6YldDUlZqbWI0MkJua0JmL0NKaXov?=
 =?utf-8?B?dWJwMTZoOGJLNTBEQlZDSXcvRCtJMmdCLzcreGxxK2lIamFrUGxoU0FZRlJB?=
 =?utf-8?B?RldiOURrazlCMzlacWRnTzg2WFlWQVR3NGl2SzRlTDZZWUFDb1N0aHlndk1E?=
 =?utf-8?B?WUpIdEY5VGZoWll4cUd0Q3MreEVHRmNOYlZ5aXdmbk5yTE5zSWZ4Z2xmMEdV?=
 =?utf-8?B?bWx3STZmOGNKbE4zeGNVNkJBaldOL2ROZU5zTFdiaVhOQmtWdG9oNW5HS2hP?=
 =?utf-8?B?bXViRGFSajZiWCs4Q3R1SVVrTVJCaGZoSTRkNlJwdHVMbEM5QzRTTTU0eE9T?=
 =?utf-8?B?Sit6WW1reXo4U0lTL3lzdlZtejZpYmhhK0N1dkZHK2JML29yaTZmbE5hdnh2?=
 =?utf-8?B?cVRHeE9aaVRjcElXaGRnZzhnenJ4TS9LNnBXbmJNSEtYaU9SbUZWcEhXeWN2?=
 =?utf-8?B?VG1VUVloS01WY1RWRVFtRWZXRmhqek5rZEV1M0h5bHFIWTROZ2RtZUhZczI5?=
 =?utf-8?B?T2ZFdDFIcnRuSlQvb0lLejY2ZEZGOVkvN2ZSbUxGWHAzd0VNZ2luUS9XQXd6?=
 =?utf-8?B?dmZORzZZTmJBVGYwNGJpOThWWWVYR2pOL1pVYVhQZy9LSXlXaHpKYlZHR3Q1?=
 =?utf-8?B?RFZoeDQ4NGQ2bGpLTXd3RXd2Q2FFODlEK0IxdnNCeXloejFHNEt3NXBPR29T?=
 =?utf-8?B?Yk80SFUwUW83VWZLUlVHQ1lMQ2JQQmM4eU1HaVo1ZjFhQ0VyTlpZOWphZXVU?=
 =?utf-8?Q?jt/dyHClhOkATYAiZsUkLoTk0H+O606DyvAa8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6382.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(1800799015)(376005)(7416005)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXByN0Q5bFJrK3hhZWlacGE3d0RqUlRSOXZrcEgvV0VvOGFBdGN5NjZSNnZv?=
 =?utf-8?B?MVYwVGZHOHFkZkpVdFpWSzFTT2ZjU0haN2s0M2lxYVdqblNLaUF0ZzlSdlhO?=
 =?utf-8?B?ZUJ3WUtXS015S05Rc2Z6VG4yVXZBZjV5aHg3UjZweTVqMWJyYjFQUWhIWDlO?=
 =?utf-8?B?eEZZVjdIZ28wbGVKYTE4YnN6QUoxbzdaRllETDBFT3MwY3hpcitDSDlVZW1z?=
 =?utf-8?B?dTJjS2VDMVUyV04yUkxNdWFaUDFySnBZb3pzZXJEOWdmSTBFamtJSXZVVlZW?=
 =?utf-8?B?SWRycVBMZlN6UE1BSzUveStabFpuNWV3dUpUTDZYL0s5R1JXOEl2YkQyYlZN?=
 =?utf-8?B?T3A3QmcwcmRNMitvYkZCdlIrTXJwN29SczV5RHVEM2ZqUU5VOGJLRDN0b3ZP?=
 =?utf-8?B?Mi9yWEIzYTUyRmpqTVpaVy9LSy9uZG1ZTTltWGc0Tjl0eXl6emorNVhsenNN?=
 =?utf-8?B?SS9ubWxVTzBjVkxmMml3RE11YmxZdU05bjdiQjM0a0lOUzRUZUhsL0xTbjR1?=
 =?utf-8?B?bkJ0OTZ1bEpQaHdzK1g4V3V3K2FXSEV4UDVoRDllMnRVZXF5cFcyZklzbVFL?=
 =?utf-8?B?dFpVYWJaYUxWMDh6eUZDeFhNRkpyNEhDVDArWm1aQTFXWkF2SmRGa2o3bStl?=
 =?utf-8?B?SnNjWWxSdk1EWG9FM1hSQmNCVnF1WG9raVBtRHdNUmtYQW44RjBhQlMrY2JG?=
 =?utf-8?B?aENybHNXWFk5YWJVRTQyWVZJaXoxNmNTaGZTaHUwQk9aNENQMFhUcDR5ajdx?=
 =?utf-8?B?MGNSeEdHVUZZTmUxdkVBNXd5WXJHRXViVmVKcFUvU09CV3ZDTS8yQnE3Z3hv?=
 =?utf-8?B?MFo1WUZnd1lzT1h4ZDc5eW9PaEFNRFZKTXMzanM3NkRqRzBFL2xSbFk1Sm10?=
 =?utf-8?B?blh0WkxZNW81UlE0S2xRR3FWN1dQMkdjTm5LM1ZKbUNKb2ZmVU14WU80ODh2?=
 =?utf-8?B?UHZBdUJ4eURicC9NUDJHa3pjVmVmc2NpaGFaeWhxVkQ2OW0yZ3kxbTd2MWkx?=
 =?utf-8?B?WGYyRWwyZE5nMnVoREljWnNaNXFIOUk2MnhCK0RIRHRNdnB1eG9OZEFjMCt4?=
 =?utf-8?B?K0ozeGQ3ZjY5OTFETGlId0lRNFlycDczcHRqUVQvSFovSDBaNjA5cjFHcFBm?=
 =?utf-8?B?MWFBYnRjVThaWkZDRkgxL0Q5M3N0ZVd3K3JIVlhqUW5wVnpnQ3FjZnRvQitw?=
 =?utf-8?B?UDlOU2Y5SjgwNUNXSGwvRlZYc0FTRWlFSlBSdVIzN2J4bFd3V3djL3ltRjNx?=
 =?utf-8?B?a2JQVkhxRTBncTZsZTJHYVFkbUJOWUx5ZktXZTZOOVBxNHR1S3kvWFcrQkgz?=
 =?utf-8?B?bHluVFdoeUVnMyt0NzZvZ2RZY21JS3pWTnJadGhmcVc3OWtDbFoyRlFGMUJL?=
 =?utf-8?B?U2Z4YllDaXBXbWg2aW8wMFRRUU1YYy9WT3VuK2s3M3B2bi8wOXQyeTBYaW96?=
 =?utf-8?B?MVNYNmhIbTBvaHUzb1A4WUtEZWx1Y3hCbFdIbmxqZFJlSjc2VDg4SFVZb0gy?=
 =?utf-8?B?QlJJMmxvNS9ZYlhQRTZTT2VFWElndS9vbzhvM2lRQWZ2eVdwNlUzeWxCbHlF?=
 =?utf-8?B?elowYWdtODZKREdpNkFldkRITjVzSGpJdS96WWhhYllhZ1RMdnFsVlUvaEF0?=
 =?utf-8?B?blUyZ3BDN2lkSEFlTEpzMzVubHUvcnlJaStFRjJhbzBqNDlIcmFLWkhBK0ZM?=
 =?utf-8?B?T2ZLRjRnL2VIYk0xQ3RQeVY2K0c5SXErRjdiZ1d2WTRsbDlRM2VucU5RQkZk?=
 =?utf-8?B?UFUxSHBtaHNraU5nenhMdzZURlhmTzlrNXNFM3lKUWJuV0tNRjVERlZHUG5k?=
 =?utf-8?B?YlIyZXlVOStlbmRtRmdBeXNNSjhpMFNRQWJMRDcwelZ0Qk11d253NXpPZmc5?=
 =?utf-8?B?dDFMZXBmazNvNTgzSzZ5ZGl0UEVaQ2MxZ28xUVVTSXQ2ODBsT3YzajM3eGR1?=
 =?utf-8?B?Q09mekJmb3lIWjNBVDdGQ3Blb25zSjRuOStYQVhjQkh4TDlHM0xwOUx1R0E4?=
 =?utf-8?B?V25pd2s5ajhOZmtObXg4RUhYUURNOTlCaVNBNFZCSFdaTTdHUlJzUU95Rmk0?=
 =?utf-8?B?Rm1XOE5VOUs5ZGxuOStPTi80eDNTZE5GUEVydkY0elRQNDg1cUE3SVcrRDEx?=
 =?utf-8?B?THdMdnYwc2d0TVdOQWRwWU9qdnluRkNmSXNsWVhPTU9LbWZoV05VMC9SL2tZ?=
 =?utf-8?B?dHc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a65233ff-df6d-4f97-08b8-08dc8a0bdcf8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6382.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 11:44:34.1463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KTN062PQ9BbsPHXktXOo/evZaF3s11xN8SOOJhiZjlsDo0tHoltmnEnrDpgpkM042XBeKIJ3wdajmzvH628t01ig4xCUSydvx8p0//rPJmk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10301

Mule emulates an I2C mux (address 0x18). The amc6821 is exposed behind
this bus.

Add the mux node and amc6821 as a default device.

Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
---
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
index 39d65002add1..14f1322c162f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
@@ -32,6 +32,7 @@ button-bios-disable {
 
 	aliases {
 		ethernet0 = &gmac0;
+		i2c10 = &i2c10;
 		mmc0 = &sdhci;
 		mmc1 = &sdmmc;
 		rtc0 = &rtc_twi;
@@ -249,9 +250,23 @@ &i2c0 {
 	pinctrl-0 = <&i2c0m2_xfer>;
 	status = "okay";
 
-	fan@18 {
-		compatible = "ti,amc6821";
+	i2c-mux@18 {
+		compatible = "tsd,mule-i2c-mux";
 		reg = <0x18>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c10: i2c@0 {
+			reg = <0x0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			fan: fan@18 {
+				compatible = "ti,amc6821";
+				reg = <0x18>;
+				#cooling-cells = <2>;
+			};
+		};
 	};
 
 	vdd_npu_s0: regulator@42 {

-- 
2.34.1


