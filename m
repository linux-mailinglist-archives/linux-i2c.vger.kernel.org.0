Return-Path: <linux-i2c+bounces-12779-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D675BB491F5
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 16:47:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76D4F17110A
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 14:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ED6C235BE8;
	Mon,  8 Sep 2025 14:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="j5m96H+i"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE651CBEAA;
	Mon,  8 Sep 2025 14:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757342826; cv=none; b=Qk0idyTb6g7YkJGSkU/noxnZ6M0dzAMslPQTulFBEzO4dvMsJJmLhKALJfwuY0yApp/lH+yH2Z1exo8P4F1KZttIgH3ijhE/1/EYiZlvfCFIfHKx5+fUkzxZdmqcRVZuTWfmLAKTL6cf7D9dpMh+VYDswgnQg5R42ulCwAC5xj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757342826; c=relaxed/simple;
	bh=9FtytSLcPDTzcLt8Gmz0cfBpiTx/J/lLRNJG64nYcXI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yni8nsoGF53Rj5ucSgAQEvCnclml6R0PGbC91Ctxyxe9/WC8zlOmn9C+ouwBFAGUEADsF17TVMETSA5r5TcALXYTDxlS9+DtncsAk4XiffxCMPE8rewfMpzor+VAcHzlEAI8mhltbbbV2qgiuBlqmUje9PrCqyYeu02IyqTnnzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=j5m96H+i; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1757342808; x=1757947608; i=markus.elfring@web.de;
	bh=LTcqGD2ZHZomvMiCK1tsUqyaJDh60KaU8okrgkX/cAo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=j5m96H+iJwgA4jMaYVq27CyH9CRe7h7EClRvO/AnRgt87ksQwZCvXTpPUwBLM7fF
	 638Mgwj0EP8n9Cd92ZZ9eWgshjYUupeKZblIIr6nLR6nTiARtBAOzUO3RuqBesXE4
	 6rqkPwyBESHp9/YXrCgOf0FGLCtf4j1ChpnD59lz52zo+QOvyx3lRTwIfkGpfJniT
	 dQZeaxn3RGkazVLfTDjpbuVv6et0qFg9c6S5cWrS5jIQ8qhJJOjEznTbqX9NaMoUW
	 b7c44CEMRDB/iUG/NSRynWZHvNaHZ3NgN28u0ndqZuzuvUPw5WIP6whuSXTUhx8xR
	 potj2JQrxT4D1B7+uA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.229]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MBjMO-1ujU4C2QJw-00DIwH; Mon, 08
 Sep 2025 16:46:48 +0200
Message-ID: <8c23242e-348f-467b-adc1-deae06e7ea09@web.de>
Date: Mon, 8 Sep 2025 16:46:47 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] i2c: PCF8584: Fix debug macros defines of if
 statements
To: Cezar Chiru <chiru.cezar.89@gmail.com>, linux-i2c@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>
References: <7e155481-b1b7-48db-af64-6a313ade1bbf@web.de>
 <20250908133608.45773-1-chiru.cezar.89@gmail.com>
 <20250908133608.45773-2-chiru.cezar.89@gmail.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250908133608.45773-2-chiru.cezar.89@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:r4ZfHRm16/cy4zFTkq0C8nTuONFJcWzKUSm4AP+IKa3sSP6tB0i
 6kNvc9fUSlS5vCSg4Lag/byrOX7cPJecEEALgL04VY5CaKPSqIfgc0ROr0njnVmyDroikEn
 dkkhT1JmUWxbPNDZmpR5WAiYNnbX2EWEEvFCvPbeXtwlZXyu459EngeZUe8daokU1CT/wow
 Y4jNAP25Ytv1TUmMBPOSQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gkAvzbFbguE=;toucrV6BWXG6GnrbalSNKv6C/Ce
 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

=E2=80=A6> Change is necessary because =E2=80=A6

Does anything hinder you to choose imperative mood for change descriptions=
?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.17-rc5#n94

Would you occasionally care more also for word wrapping?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.17-rc5#n658


=E2=80=A6> ---
>  drivers/i2c/algos/i2c-algo-pcf.c | 27 ++++++++++++++++++---------
=E2=80=A6

Some contributors would appreciate patch version descriptions.
https://lore.kernel.org/all/?q=3D%22This+looks+like+a+new+version+of+a+pre=
viously+submitted+patch%22
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.17-rc5#n310

Regards,
Markus

