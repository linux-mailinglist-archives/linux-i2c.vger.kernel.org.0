Return-Path: <linux-i2c+bounces-15095-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF57D18948
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 12:51:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 290BC304292B
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 11:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 753021EF36E;
	Tue, 13 Jan 2026 11:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="IK6cGx34"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC891EB5FD
	for <linux-i2c@vger.kernel.org>; Tue, 13 Jan 2026 11:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768305032; cv=none; b=GHTBoCNNSrSnmyMbscDQhxWnurvbbqlgu9dEikNIE2nOBqNo3j55iVQYc/65bYN81W3phXkyQVY498hjtBnPYBGY9J/PCbMfA20ofbTcgKz6j2swwX1rG5coR+zsekvv9SYWdkULMrkRhbQbThVSLvmeYAysUPqXWORqwTQnVmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768305032; c=relaxed/simple;
	bh=n4OVLfYY0h+IhJRy0NAJNM9iTR92XV2VZ5uyTVzCW10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lkx1nPl7TLY8HLPxXvj0Gq5HrUQ63LdX0oXmjsWkkfVgPTrnlArTxWDNetkVNfipPSG9emhtcJRKC915rls3ecaYJnk0xvZVr8zEDSN9N1V+vpeSOEIEgSGbxufAadnc9ig/PjL3f3pPKI4T0oHi2oeGyJMIVvaaZDxB1iKgGvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=IK6cGx34; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=n4OV
	LfYY0h+IhJRy0NAJNM9iTR92XV2VZ5uyTVzCW10=; b=IK6cGx348zX7nPG426bj
	8pPnKRpaSVk7EenccYs2FR7/yoEeCbW95pRoGqMTBs3I4Rx4GXVA2VKIqoiZm3lP
	i4KGG6AZ8yTUBSwhhme6M4Tb+jyrWuCOfdoAb2OK1uVl/DGQvEeeN4sTV6b6oUxh
	JX3+mzlFDfkdfFVHJDTMKv+5v4hiUFNPlM86mcoJc3DCYD6p/P2G0FwdXGDxAyCT
	X74tcUuRdXObFtGQ6Su9RVR+dLqe+0lCYNQxILagDFy/f6uijcSKThYtmM+ZT+uh
	NWW/idAeMF6/hdDpaKi+GzTZT2BNpV0/aLndK4mEUffpmWU1arEmQE8L+528wqcS
	eg==
Received: (qmail 1666866 invoked from network); 13 Jan 2026 12:50:25 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jan 2026 12:50:25 +0100
X-UD-Smtp-Session: l3s3148p1@FUTjmENItsIujnvx
Date: Tue, 13 Jan 2026 12:50:25 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-actions@lists.infradead.org
Subject: Re: [PATCH 00/12] i2c: add and start using i2c_adapter-specific
 printk helpers
Message-ID: <aWYxgXn_2WlHLcj1@ninjato>
References: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>
 <aWYiJbtueA8g3srn@ninjato>
 <CAMRc=MfseaLWfYuhz=5MxRw9dtBvOM4X6brPwT2PJ4Fq7rGbfg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfseaLWfYuhz=5MxRw9dtBvOM4X6brPwT2PJ4Fq7rGbfg@mail.gmail.com>


> Yes, I agree it's too late to queue it for v7.0. I actually wanted to
> rename my macro to i2c_debug() to avoid a conflict with saa7134 but
> you're right, I may submit a patch for that instead for v7.0.

Your choice. I think keeping 'i2c_dbg' is more consistent but the
dependency on media might not be worth it.

I set your patches to 'Deferred' in patchwork. Meaning that they will be
handled as agreed above.


