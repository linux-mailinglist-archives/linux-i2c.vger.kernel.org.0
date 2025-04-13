Return-Path: <linux-i2c+bounces-10296-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FACA873DF
	for <lists+linux-i2c@lfdr.de>; Sun, 13 Apr 2025 22:49:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B79B316FFA8
	for <lists+linux-i2c@lfdr.de>; Sun, 13 Apr 2025 20:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 465E01F4176;
	Sun, 13 Apr 2025 20:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RMF4iBYT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069CB1F416C
	for <linux-i2c@vger.kernel.org>; Sun, 13 Apr 2025 20:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744577343; cv=none; b=pSHm4/mT+tD1+EzeXmnJX/rWt8E41l9ZK8PdUHZvg2kjbgcrp+7CN6qrmd7TPfb3FvakhVTWooLpGdQrSS95bubp+OgHVIUtLsX0o+u4d+k1+F6wSm79KiBfzf7kovn3s1tZh9Zt/CN+MFhPAZ3OIwV3KdsnLv7MvVCNSaKjPnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744577343; c=relaxed/simple;
	bh=keS2Csl8R+4p6DzlVpDHBEWL+9O3J6ZfqurcSpSPBE0=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cDtMhja7SdigxV179uKvFkfGk4chJCOuB4aDBYXxJ4UhrmCwR6BBQr5lMsEwPGr7t0bp/btuDqshF0Nt5U/wPwl8jn50jd1Kno3yKO6cDRJM+sZVLnYwJYfEQDxQy5r3VX3F3iLJKn9Iq/cna6BFBYt4Ty+PajqkdAhCoZHWUoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RMF4iBYT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4E66C4CEDD;
	Sun, 13 Apr 2025 20:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744577342;
	bh=keS2Csl8R+4p6DzlVpDHBEWL+9O3J6ZfqurcSpSPBE0=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=RMF4iBYT97uDDoqlmeuugbNFgHo6mLmjnuuiY/Ua7h4xJcaUqnmv3k44MJhjrszlE
	 kG+D4cIzuc0fCI3RgnjIj31k4zs1XbaAjdhbKYrjPYcuOkmE0MogNAvW4yoWAfwpvS
	 GcQ2DiSlBwZmbqayE0wH98apSqGd2TTpn2LAIk9RLD8DgGEO7VST3IKbDElVmrTMC6
	 Rp9GZZWSu4g1lMYZpBeuXZSMpcXJINWZyxWhYVxCwi+YwNovOJkK5upaAwMeiK7QgO
	 WCLWUNiXLrPnemC9ktfSqkdkjfpr91+rU1jbpzMa3/oaDSKb4sV8BmwbD5z9BL3EzN
	 jZiNpKYP3O/BA==
Date: Sun, 13 Apr 2025 22:48:57 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-i2c <linux-i2c@vger.kernel.org>, 
	Zhang Songyi <zhang.songyi@zte.com.cn>
Subject: Re: [PATCH v2] i2c: npcm7xx: Remove redundant ret variable
Message-ID: <b5xanbv2wwu27fapc3wihbggiwi4nbdrqhiichzna455rndwqo@nlj6zphrwdiv>
References: <20250320004321.1914366-1-andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320004321.1914366-1-andi.shyti@kernel.org>

On Thu, Mar 20, 2025 at 01:43:21AM +0100, Andi Shyti wrote:
> From: Zhang Songyi <zhang.songyi@zte.com.cn>
> 
> Return value from npcm_i2c_get_slave_addr() directly instead of taking
> this in another redundant variable.
> 
> This improvement has been suggested by Zeal Robot <zealci@zte.com.cn>
> 
> Signed-off-by: Zhang Songyi <zhang.songyi@zte.com.cn>
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>

merged to i2c/i2c-host.

Andi

