Return-Path: <linux-i2c+bounces-12405-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CD6B33050
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Aug 2025 16:13:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC20C176C90
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Aug 2025 14:13:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 580EB2D7801;
	Sun, 24 Aug 2025 14:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="suG98UBj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDE01F92E;
	Sun, 24 Aug 2025 14:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756044778; cv=none; b=sw1Syj8JOxN2tQ6/IpqmfWxCLZk0JX3sCefpUaomHRTqDetIwULRiI5v5reqollBRFRXsNO266G6D+3+o9yDFtNCmdp/JIeesvE9K7OvSTG3KO0e40cqKitD7GdnrMCKFCNf7bk6WNzjdhs5G3FARgu1k83rjMAD9PMF+br+PwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756044778; c=relaxed/simple;
	bh=tgMhq47ADStvv3ukdWgvk42MXB7auOCwUgUexFLIPGQ=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=DLvw8mlmi3w15i7AXAjB30ekJxgrsLGwAmPTmsUlJkZ1mx9LvGI/p+2uV7QAOTObGgmPX/IcVets+g5b9FjGSysXJLENQLGLvdbM9eEuaJq5dKYcJXcXiS77HsQHGQ9vyaSOZiGT6HbnadugPtKQ+fK2sYB/1pnyVHdgiHqDQrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=suG98UBj; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1756044755; x=1756649555; i=markus.elfring@web.de;
	bh=IF9OrTStMQ5gCBVUDM4MqgCm64I5ezWb52U+IQsONjQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=suG98UBjLUCRm2rFzJXB9WzhQSqr+GwDaiPvgwzYNi1zaQE0aV6fpzB9VnVHwLDk
	 hVh4ymzTE084vHiWDpPmVohnUY+3DWBmaDlPIg85Irg8QFSqHLJsbkuzZ7cKqhkwq
	 59NG4C7whJdKm6jPIOnQn0NwDq5zMRyjCzSqUFE/O8WuCX85w2XodcuqqZLzYHPZm
	 OCY3m3apuY3R4rzFndois2/cbrMIu+eURaC96bUhawP9+A6AyrG/RlJuTUcqtOwX/
	 tf+SgM+g3NVWnNw07VL//l9qy7nezOKMNU1hoE160anyLOAQqx1kAN4zXwMKojh6+
	 bTh0Zqsl7hT7mXkGXw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.216]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mtgyp-1uWqzc0dPb-00x8S9; Sun, 24
 Aug 2025 16:12:35 +0200
Message-ID: <95e31ebe-08d8-4b04-a624-f0ecb8a57d3f@web.de>
Date: Sun, 24 Aug 2025 16:12:29 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jonas Jelonek <jelonek.jonas@gmail.com>, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Conor Dooley <conor+dt@kernel.org>, Harshal Gohel <hg@simonwunderlich.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Markus Stockhausen <markus.stockhausen@gmx.de>, Rob Herring
 <robh@kernel.org>, Sven Eckelmann <sven@narfation.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20250824113348.263475-11-jelonek.jonas@gmail.com>
Subject: Re: [PATCH v6 10/12] i2c: rtl9300: use scoped guard instead of
 explicit lock/unlock
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250824113348.263475-11-jelonek.jonas@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7A+G26elLF3tkqlCHoDcOtQk6I3vX7aAy9l2ZsTJvGOOxIGF1Kp
 PcP0SlSBmSl4YQkfLRPms4T4yGxiG3ZmHJZdP9+54elSzMc09fmgUfhQetOZfpz0CO4DeVY
 Fw43ENvEkv4jaAOToheXIbNtNn9OA7QruKSKfdMoh5ApDiaPvNN7smn/Q1muc6o+IYiOaWA
 eE+tYSeMu8UPMxs978Jdw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wASyDGyPFYY=;JEy5pKxu7ImbD8FTIrptSnIeFUy
 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

=E2=80=A6
> when the guard goes out of scope, instead of explicity lock/unlock. This
=E2=80=A6

                                               explicit?              Woul=
d such a word be nicer in the next line?

Regards,
Markus

