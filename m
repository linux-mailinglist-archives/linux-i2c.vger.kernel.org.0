Return-Path: <linux-i2c+bounces-12773-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD4FB48DDD
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 14:44:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D836C16A283
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 12:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DA992FB0BB;
	Mon,  8 Sep 2025 12:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="J5pOcA2w"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D666147C9B;
	Mon,  8 Sep 2025 12:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757335479; cv=none; b=umR1QIlHyobtshBO0YANHJTjFuM4uTJ0HT2fH2QeKVjuR9F3X3Ki5qMKHDxwtg9nWXH+26G0IJ5NxzZhUmpAl3CZBkv0ql4moXV6aCH/X5dff3HOCWlyWVCxfstwrEh2ZiVG7GhQCFaT5AcM8Ag6ga5J04s+7TvjMA1yRwjNcKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757335479; c=relaxed/simple;
	bh=ySNP8BJ3kKCCo69MZa9QDSVcgc8+HNdESPs+qHDOUhg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QGaSjJ3Qtn4Qlr7VtVohJiva3aTc8bZBTyOvyznTt6EMZLtoA3BQw7SIwxEEK6omJvs2hwkfrkx89tjvs0uQoU0JUmZcHYOmetfZfpVN6KIf4bP/gtGXlL4gtOsTYYAdRspPd2vP6xm4z+t00G1Nt2nP4BBIX5oahXekp/KZ3Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=J5pOcA2w; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1757335471; x=1757940271; i=markus.elfring@web.de;
	bh=ySNP8BJ3kKCCo69MZa9QDSVcgc8+HNdESPs+qHDOUhg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=J5pOcA2wqYWRXlSBX4GIhU88xMdx+Sq5giRNBpDsi1EkFt+Lv4ctNHHKe6gM4qbp
	 DZJrx6LZ2YwMItVjGtx8LB+qv3XA8rVEQyqzEMVpdue7Cers8RksaqeKg6V3OPCvq
	 8/SA/GtToNQy8bJnGIGx1PjKsk4Z5oCed8ONsHDRwC26ma1qaPCpoXwX+1tbKSsbs
	 l7T507K1ypFb/U+ucX+7xnszjuYNESc7tV2NrL1dC3fLRwg94hTwnlonFEtAGxigr
	 XBmXMs/FbO8xzk9PE+jilKqWz2KGhGumWXlUqxccHCDqGYZvhXcF4My/BKMDXsxhT
	 NNxsTssBGhajyAnuWQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.229]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MnpGw-1u6M6P0jjW-00fyJC; Mon, 08
 Sep 2025 14:44:31 +0200
Message-ID: <7e155481-b1b7-48db-af64-6a313ade1bbf@web.de>
Date: Mon, 8 Sep 2025 14:44:30 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] i2c : pcf8584 : Fix debug macros defines of if
 statements
To: Cezar Chiru <chiru.cezar.89@gmail.com>, linux-i2c@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>
References: <adb7d136-eba4-4ed2-b893-4f7c43f8d678@web.de>
 <20250908111355.79222-1-chiru.cezar.89@gmail.com>
 <20250908111355.79222-2-chiru.cezar.89@gmail.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250908111355.79222-2-chiru.cezar.89@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ICYz9rykI5IpuSO68rOFsfizB+fGtUSmZg4ln//rCBnnzrPaAEe
 EmAWLGe+poNNkQXkiPECk2NO7FaRuuq+RukIOEPYruuvN/DIpzFUGiCb8Kf2LM5xzUR6QBS
 EjoWWwcLNST6QAO5S+th6GuS7i11bQF5dAsjQ7oQntu60ZVen7HLoYll0m6kWqSX/tjtvhG
 h16El8vrhTE4VYiM3U9qw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3DM8/wLMo7c=;t96VK2lXfYWzseoy9CdcCh52bwe
 +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

=E2=80=A6> The patch fixes this and =E2=80=A6

Would you care for the usage of imperative mood in your change description=
s?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.17-rc5#n94

How do you think about to omit space characters before colons in patch pre=
fixes?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.17-rc5#n649

Regards,
Markus

