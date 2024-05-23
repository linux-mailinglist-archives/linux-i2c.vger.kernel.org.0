Return-Path: <linux-i2c+bounces-3650-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 346238CD74D
	for <lists+linux-i2c@lfdr.de>; Thu, 23 May 2024 17:38:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 644381C214E6
	for <lists+linux-i2c@lfdr.de>; Thu, 23 May 2024 15:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CDF9125A9;
	Thu, 23 May 2024 15:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="svLxltUm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4845117999;
	Thu, 23 May 2024 15:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716478692; cv=none; b=A1IDOTUhLBr7kaONKjlkOXVw6czFAf6bmmQOhkwdkFPPes0n+DNjx57fLxl2+xgGL0ztNGRuqtS5E2Bg8m8xBCjk+EPSpS/ag0NHznWuPE8vSP37RCrQ1pSDHBOcriB4oneEzl3GBbdP7oOOEWyDBGqfuWdtNQvvYZr2bOdmDck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716478692; c=relaxed/simple;
	bh=zCQjA/5a6mMmlaYjkFL5H55+TN3ow0QoYukyt9cnByk=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=O1Dd3RLV22H7+h7HKQ6xme6WPe1DAeh2q+bzqPYVR9CS+P/vvouMYMLKQcL0xxhfaOQ1hSW+ORTjVqfuWxrQ5/VG6taO0ztheGiT2COcl7z2//xPqKDBxKF9LI3+b3nZjwW7+1szTMwM3pmVem3A7kWrr3uNOUptach0/1eEWFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=svLxltUm; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1716478669; x=1717083469; i=markus.elfring@web.de;
	bh=9+nxfIAX4pQNUcpluSGV0XxummSpstZaxeh2ZeUEgLM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=svLxltUmJKc5H6C+lrIx0Thh+k1aqmPiG9PfWNsmCyHaWwmOFcb4s3l+af9+voSt
	 gNVXX16SBXkb3/7AYxUodd7o63uZd4xMrxybFzDsogXW9JGcCXLt3nh8EwL3uQVm5
	 BI2457n5a62986LZrx052uibVrTRSy6TVDFEjPB+7bahtf2FIAlPGdKQkwh+42Nq2
	 gqdYE/Fc6Zx1ihflcKYCblq9ijTEyjASqVB9dP99cR7/SnqPcCsf6va3rZcXoV0z+
	 E0lPJe62EuYprpw7TqjopZ58WZhOcDubCX+H7yFCStnVm3MICzf1KS0LnES6YMi6c
	 h9v0y9mXm+h3PjBTEQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mft7j-1slSGy1Rc1-00gDkv; Thu, 23
 May 2024 17:37:49 +0200
Message-ID: <58cb9176-bedd-4219-9816-495cd6b343cc@web.de>
Date: Thu, 23 May 2024 17:37:45 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Eddie James <eajames@linux.ibm.com>, linux-fsi@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Lakshmi Yadlapati <lakshmiy@us.ibm.com>, Mark Brown <broonie@kernel.org>,
 Ninad Palsule <ninad@linux.ibm.com>, Rob Herring <robh@kernel.org>
References: <20240522192524.3286237-5-eajames@linux.ibm.com>
Subject: Re: [PATCH v6 04/20] dt-bindings: fsi: p9-occ: Convert to json-schema
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240522192524.3286237-5-eajames@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6uUBnjXwoYTBl65AmSP4bcUm9yYkqDShAEAbhWM6H189RdKKnxz
 oVcolhaMOwtEJcXr+cktyel6GIa8xr80cB2NMgeeewp511zPje/1jngr+m2B8UhYPxiOGI+
 nCe/2N4ClNmZZHeH0HGzAP2dB6XWRrD6LLsQUZyKrG5KUOaKxlB7/mW0bd+dHT5Qd83ZC8Z
 0jspFu+iLQADHLYV/qm+g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:AMG44tVUeQ0=;gHcW+AfMMVcn0FO8GHdTGTcE2L9
 JbmxHGHiETfcIxNUAkoM8lPOUnEm8Cqtt8IbTY6kGFJv+eumNedF6Sw1/mAxxYSJJYJKzCqW+
 l8vF3QztykQnys9yOlSdxg0Vu5u63kdNOlfCMlvSidXL3LvNXu0X9DnhIan8eZs4fgrGi4nHa
 j3Ek5aLNqXh1vaRlDi5OB4Ka7IzMh1tNDeY2GWpz3TQCvkLVfHMPTVyW0S4Iiv3A8RVRsKNLY
 PK5N5v7ud2xznfxgj+m2vu7g3aWoRd28rAROp5NE//rgnXqG8OKN3Nfm+32ZWaez+nzUDq2BO
 2tAam1pS4nnBP04SG+oAjdnzovMYU9QjXzFV5VK4OGaXtGEwT1EVadLqVIamBrdMFUbnKrQwb
 JKIud+t1E/NRF5gfXguFUB+0NDYuD/Fq8AreOZBl/aM+ORRH1PFyVaWSqhuVjOLp/3NpyLezS
 whSnFB4snfj8STEEFTzXYZdC00s+DPkSS7dTqL3XsIOKgPTwNGJmDv3pOVZkXPz/nHLpsdj+m
 ROiffKtt3PAO/ZMEzJwartiHNDcgH3wFS0HtK21MqtmMGFr+9FoRoVjhymlVVgKA+KdBCIjo5
 Kwih5/lJqlKyveneWPTaYUKnLnqS7B2iRP5K3HjZTu5KtYZWmaVuYTisuMUNrKISvptS+lafR
 CUE9a3R8BU21soinyJdsfOnX5POH5kla4nHqavWasP+6ZVJpztt81Taa/JsnRS8p8aZkwiTHe
 EFa5OIFmRfak3zG7JhkbjWeWDfuMjEazOVGlyPovZYdlyH+cHSXdJUxFN1L3za80taRr6zBrA
 Mp14C/eCWOcywrKj1Phe2oNFaHQJdWQGTJPdAGqA6GhdQ=

> Conver to json-schema for the OCC documentation. =E2=80=A6

  Convert?

Regards,
Markus

