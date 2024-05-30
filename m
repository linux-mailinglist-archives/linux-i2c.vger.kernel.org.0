Return-Path: <linux-i2c+bounces-3716-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEB48D52BC
	for <lists+linux-i2c@lfdr.de>; Thu, 30 May 2024 22:01:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6DB94B22E91
	for <lists+linux-i2c@lfdr.de>; Thu, 30 May 2024 20:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DB2D4D8BF;
	Thu, 30 May 2024 20:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b="F1gYsAVd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C2881E;
	Thu, 30 May 2024 20:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717099274; cv=none; b=mARYx2MKO5DqhHPzE/cCK7Q6UauHGeHGGljApDG6by2pe32hLADRSq+xCoLElB6/GAj09DjSg6ONdvaG0fwt5Z+W3Pkeq/y+OS4g7nXMu25yrfwXTaYFrM80K7w8C9j1u9dh8RY3ziZS2QXtgkQP4r2KDu9+bvcd5Xh2TR2TbxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717099274; c=relaxed/simple;
	bh=BPyCNlVSH1EfQAKSbDWiHoDPaRYzrLTTMBUjfTP07Y0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EhK85gD5nnWpm6mveBYixNZcxhih3jPCiCvMXAixx0jJI9cq4nGkdd3iNfc/cDBfWVJBYrLTqQoRCGJtHBmcUnYGtOxSBisaqn/LNLJ/hjnzT9BjlX9Mhgp47Jd+ZTd6BenhTSfW8NOGKuNSduPnpQDs+Xl4TT6McwT05YTrKpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de; spf=pass smtp.mailfrom=t-8ch.de; dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b=F1gYsAVd; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=t-8ch.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1717099267; bh=BPyCNlVSH1EfQAKSbDWiHoDPaRYzrLTTMBUjfTP07Y0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F1gYsAVdp9ngHjNF7c8zTuA2punGS2IlhI7cnHaXrG/anDGpAWA7I4iSH8930uOH6
	 R8348Eam1Edb6so8Fh4b0LW4dXzh2w4c2vL4wxXsdHInCCJUgYeX9K1ZdjnZu7ia/M
	 ZNNabBlvbS+ET68togD9+r43M1A8eux9VGHPx2ew=
Date: Thu, 30 May 2024 22:01:06 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: smbus: Log (LP)DDR5 type specific unimplemented
 message in `i2c_register_spd()`
Message-ID: <66acde9a-b453-465d-8b44-2bfc2164cdbb@t-8ch.de>
References: <20240530183444.9312-2-pmenzel@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240530183444.9312-2-pmenzel@molgen.mpg.de>

On 2024-05-30 20:34:43+0000, Paul Menzel wrote:
> On several systems Linux logs:
> 
>      i2c i2c-0: Memory type 0x22 not supported yet, not instantiating SPD
> 
> 1.  Supermicro Super Server/X13SAE, BIOS 2.0 10/17/2022
> 2.  Dell Inc. Precision 3660/0PRR48, BIOS 2.9.3 11/22/2023
> 3.  Dell Inc. OptiPlex SFF Plus 7010/0YGWFV, BIOS 1.7.1 08/11/2023
> 4.  Run `git grep 'emory type.*supported yet, not instantiating SPD'` in
>     the repository of dmesg reports for various computers collected by
>     Linux users at https://linux-hardware.org. [1]
> 
> Add 0x22 and 0x23 as memory types for DDR5 according to section 7.18.2
> (Memory Device — Type), table 78 in *System Management BIOS (SMBIOS)
> Reference Specification*, version 3.6.0 [2]. These use JEDEC JESD300-5 for
> SPD, and, currently, no driver exists, so add a specific warning for this
> case.

There is a SPD5118 driver coming up, which will handle DDR5 chips [0].

[0] https://lore.kernel.org/lkml/20240529205204.81208-1-linux@roeck-us.net/

