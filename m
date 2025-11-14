Return-Path: <linux-i2c+bounces-14084-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2D8C5D5E4
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Nov 2025 14:35:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 38E654E05C1
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Nov 2025 13:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE33931A041;
	Fri, 14 Nov 2025 13:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="boUcVQBy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159D721E097;
	Fri, 14 Nov 2025 13:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763127184; cv=none; b=aAdRJ1KcHSwaJ9nriTm32Ih34xiMvcSMidfJZmpkrVlmO4PRiq7KlJX6Y23fq7I8xXwDL54si9NZX6gRbm4RwcB5QgDQXPyw8AuUvWH5sZmODFSitvykyEtrR5lh+TOOe1IWfQ8BZOEOcLRsK22oQJ1c5HSkbvVa3mop7x/SRXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763127184; c=relaxed/simple;
	bh=QvZg4kSAVsallHndZW9bIS1hMOJ0BT3WecGdtNUZFq8=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gC7SX7UXli4C+myqx90+FKMF2CFyJBeFS8N6WHywGkSb2PE9l1zYCOdhJxhysfOfHfbtaDZA5BSD1dZAZtRtZ2Ccer8yHS/qymJnHCTf1Pqy6fOpghzdoo+O/X157O2/eERm0L2Jb5O0CLgmJGZSExg3Rk4y9QgIPGwo6ktzxA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=boUcVQBy; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1763127077;
	bh=6Vr7eNrXe06GaK06K8cFUqsyw9DPvxY9Y0LbTUQ8oEA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=boUcVQByUEQB95sYx5zjQmu4wRgprMz+TrQFhlH6RnkdkoCHl7CX9PIiFWws+KoHh
	 RUvkHXykFrdkNmCeNc8AWVRVXtfWCx0nAjEAWHNLWIVXykNRxBXSMX7ESWFWkSN4gP
	 Mwm+sMvbi1qSe+cKCel3rOp2tJ0GwL1D7odru9Tc=
X-QQ-mid: zesmtpgz4t1763127075tf42899c1
X-QQ-Originating-IP: wIUc43NDT+vtn9rrX6Ymr6/Wn03jy8ZmRjONmIhfR3g=
Received: from = ( [112.92.71.152])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 14 Nov 2025 21:31:14 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10954986891886735329
EX-QQ-RecipientCnt: 10
Date: Fri, 14 Nov 2025 21:31:13 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2] i2c: spacemit: fix detect issue
Message-ID: <7D3550E24A1FBD6C+aRcvIfIPOpJGFnJr@troy-wujie14pro-arch>
References: <20251113-fix-k1-detect-failure-v2-1-b02a9a74f65a@linux.spacemit.com>
 <aRZQfqFjDNds19by@aurel32.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aRZQfqFjDNds19by@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Mi8ofykAS9CFf0RIZF+WOZbXs1I6FTpc7WsDqG6mxgCaUBMBS7+Lo1C9
	ir5Ysbq1JBIzxv4QgBTt6JeX8TjUFCtb9PcHNyHMCBlx3PoLowaKF2axBCe1peUHhz6FokC
	e3OxPlCp1YbV8U1O726h2S92p9leKhpBR0nielchcXrQFRZu63pP4a+h4Cx+Kc/lYCb/oXO
	4fpyI1n1i7G4jCmZfhI7o/vsD/lFR9oN9jebhEbhzhUfUyEhCI+k7hdwj/9RC/MAFiFPEo+
	iHURtxygJleAnfUFAa+7y576ftvu+2CYbQLioOx6cqU2KClsRUOULZLL78UblMUOP3H624D
	/1rw7NOwyXL6q9MFgli11hVc21nD0hhtFYaojj8hYqKNxnZvlKzbUIK7j70PAshAbQHZTLO
	URJwGmmJBGZfSBhYLC0glBBd+ftPz1abKPrNrJ0g5eo++JqFGw/lVnn7OCtE795ciNaJ/TM
	do90kGN5vqsyUbJP9KWgu8vSkfkJaHbkMBE7P24EaEjXstH83Oz5Agwcdwhfy7CKkL33TGQ
	jBPkAGqJaCSUqiZn6kSb/+VLn3Vqtgg998KZZUlLfxVOVXrJhZPovlRdVxlwNXiveKatGqV
	N2LBMRgkNz+GP98uWUbHIrtEHnOh1xSOMDRQ36tgYlHB+LKtJ6qTAoxRztRs+SVO6rM2l2c
	UwfVph1GkMZoKVu/wlxWI8eR42iGTKlIL9qoIcWp5Tr9Mpwa972fxDIgei37zFjHeFm9iPK
	t8ONgVx+m1fqhM8wcVZmi6osqKQ6MFUxXgGghjcJCn2vU/nKVUhxO4GG4VG4vG3saEIuBC8
	hoUBpNG7wwmlIpLMZyU9LyduHHsMGfEF70H6sO6CmZO7QQPsHIZBobVs/exurV1vXBggjYC
	kcKvv0MxjQshZjvVY16XTeFKtdOmvryqmLZHun7RlPbAYBGksBT8joNJFR4AVh6fPZz2JOS
	UReb5qyS2RiRzYrG4Sgynupz7tR3M37mhL7y9nMHhOzI7M0reiiXWfESqGR22U7nEemuvAb
	KLYAK9WZfcT6CWzD8y7g9/GsJl2rPvRMV3SAs9hQ2zJvly46d5agDkJVhhiPU=
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0

Hi Aurelien,

On Thu, Nov 13, 2025 at 10:41:18PM +0100, Aurelien Jarno wrote:
> On 2025-11-13 21:21, Troy Mitchell wrote:
> 
> Tested-by: Aurelien Jarno <aurelien@aurel32.net>
> Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>

Thanks for your test and review!

              - Troy
> 
> -- 
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net
> 

