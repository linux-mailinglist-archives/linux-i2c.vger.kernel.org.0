Return-Path: <linux-i2c+bounces-14783-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 75233CDE761
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Dec 2025 08:54:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 395D33009A87
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Dec 2025 07:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEBBA313E13;
	Fri, 26 Dec 2025 07:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="cdYNSvpR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6902E8F48
	for <linux-i2c@vger.kernel.org>; Fri, 26 Dec 2025 07:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766735682; cv=none; b=ml6iiFcWEaZDCddETrIiktO5g9Thy8An2WgrPCZY2X8G1TpzMZQJ+IsuVFmzC8SjAcE5KFQhRi0CPbVomM0s/TGVawY4VT/65gOk2lmNfY76S/DEccmDJDPNkDbFwxXr9Qv6KMsG9aJUTEgV4v4htdPlUwjhehx7kJ2LvBPZm5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766735682; c=relaxed/simple;
	bh=oqZDnjjZpkNlyRr0hmebLTt+r39NO5/ZRJwa+WjVV5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MzGFsy2MNtj1vPAAqB18VY4xHCJETjXnN/Ij4KyllaUClqnXbAOlGl+1Z2qIM5n64hUOpjWZD2YQVqXf/dS5rSo6mJlQKVNit7eUECVINBL5NvnMYUmIi4iAP3bsuQyDMEUIwUxSYXWbip9Z0DR6aHDrZOHYuJ3KU1MfMbzCts4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=cdYNSvpR; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766735582;
	bh=5rqzRz+DAZpWWro/FXmO/xzVSv2PlwUs0gKPEOGz7hE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=cdYNSvpRt2Endd4lQxXEpMMNt9ITTaLhvpAg5ERsa5f0hYLtYjnaOqejPhX07MGyV
	 h+/yzCWLkSO4EYibfy1igM9rsE0bvgknmo08m+MNLBduwJNj8GsU25FdYyoYqlq3fJ
	 c2AnfNkWfoipMTSnWaLOUTMAvDFZmc38pcSS0fXY=
X-QQ-mid: esmtpgz12t1766735574tec301483
X-QQ-Originating-IP: A4Tsnl5JTI7DzEsZRGnZiXX+NSH/kdjq4a+YWdmnzZU=
Received: from = ( [120.239.196.19])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 26 Dec 2025 15:52:52 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6635047226762412195
EX-QQ-RecipientCnt: 13
Date: Fri, 26 Dec 2025 15:52:52 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-i2c@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH v3 1/4] i2c: spacemit: configure ILCR for accurate SCL
 frequency
Message-ID: <569E6DA87DE510D5+aU4-1Jl9XxjAWQq4@kernel.org>
References: <20251118-p1-kconfig-fix-v3-0-8839c5ac5db3@linux.spacemit.com>
 <20251118-p1-kconfig-fix-v3-1-8839c5ac5db3@linux.spacemit.com>
 <81eca0ab-47a3-4b12-98ae-fbd46a15ff93@riscstar.com>
 <BD74A47E5BB66010+aU4j6CgGxebcBV5I@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BD74A47E5BB66010+aU4j6CgGxebcBV5I@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Mf2c2cXG8XEigeMabfrexd3DMjAQPofMXRXdqz9J/jtmeegkGJ2HNWF7
	SAHH7rF1i9va7PNDp9KiIp7vW7W0zlsBcUC+4li6O90WXkv3i60Z32TEJdT4X7wUTZ+tDPg
	NTd5j9c+tiFfq/HNohfVKJCj5zK05XwQJDDZf+1+S3l1V5T9XLGdOrpImh2/EZp7UV0rZzH
	2aA2cOi6n644hFSegaTU7bXhfDIzjImRzH3dkqo1xIZCr8Q3laMdg8gh9WbERITDmCQovum
	K29yOQCC2iBwZH5upwnPBrGzkdqm5CWZPNVuwofCZMfU32FpOIsWftKURuv4+Z9bkvYjtpy
	9rxIDW3rixjCHiyrDoE0I48xJRnI+JY3UC6Jqiu4EL0JKcAUiVqJSmqfAK1hKA79VEtvd4o
	DnJ4X5gYbG0FH2B+9mufXUkR10RhBN12w2VxK5YtL+L49AJ3IrFYex+mcfQEjdS1Ht1ZI6t
	AuhWW/OJs0Ug5cNvIMS7RxOkebS1l4kZDPKqf/cqWd6egkGWje1DYlQCX+5umG3O9W4zx/2
	UHM8b3rovYEU4tx7RQO7z6rnGI2RWncxhFMmuHE1S8kfe/A5DOGDz9F1MXsYxzx09V7LyjV
	Rx0ND+Fls+JDkWnEP9hnI+WKGHG/zM90i68zcO00vpPe5eJ6X+Z5/1dcm9Y8V/TKHuiIHM4
	kG3H5QH2bbFEJffP6Q5xRZHe9k6CYrMgBJxjj+LP4KNyzEiOHYsZljPTWH2HGOcxbfnBSl5
	c5eZWNf44ROA9ET9ub8pqxExjRfyR/Yxwp2vZoJ9l5KGd4VKAK2Bj+PTMQMd9wBi1x8y1TE
	R/Xm7SsiGUBFQALgWEUH82qrPJ3ZadofzSYFyDrHY5RDyY2LzSlwERzzzAfrVRZFkDaH6QO
	Lp1T/LJPUoUMr9emhOP2J0GHmNQDTO3WGNHDh+qTEITXkfDNdzi/sydkkxXsUECGT7e+kx+
	ecTORDNs1VPyNKuytqbQ454Qp6uKr1Dwbq+dRrpUgIqZaPikvWkdHnQIAYPcSg6sXweRFZh
	n8M4wp1RsPU35sJfzLAB1jEDWTY/ozRQVwJIVVyNl7vnTRvat3ne48SiqEdzI=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

> > > +static int spacemit_i2c_clk_set_rate(struct clk_hw *hw, unsigned long rate,
> > > +				     unsigned long parent_rate)
> > > +{
> > > +	struct spacemit_i2c_dev *i2c = container_of(hw, struct spacemit_i2c_dev, scl_clk_hw);
> > > +	u32 lv, lcr, mask, shift, max_lv;
> > > +
> > > +	lv = DIV_ROUND_UP(parent_rate, rate);
> > 
> > Would DIV_ROUND_CLOSEST() give a more accurate value?
> I'll test it.
Same result. So I'll keep it.

                        - Troy

