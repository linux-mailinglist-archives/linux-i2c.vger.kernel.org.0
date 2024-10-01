Return-Path: <linux-i2c+bounces-7114-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 827BF98B3F6
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 07:58:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B455B1C2324A
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 05:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5056B1BBBC6;
	Tue,  1 Oct 2024 05:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="D/qQE4GD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CCA536AF8;
	Tue,  1 Oct 2024 05:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727762319; cv=none; b=mfOj+pJsVJgFKR/z9PmMWv5o9QzZyKRC3hLK3VFke0b/TiTUwpFU/iTzfVYzUniZnhXq2JLkRa3uaA7FhzSAzYxVC6Mcw5So6Mt23bYc1GPcgl/hl+QPcTwJwavM9enD4PlwYsnh+Ka2dwNudiy/cWDOt8h6U5anVaTGPjdis74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727762319; c=relaxed/simple;
	bh=ZxPulG502QVb4hjtqKEZ7tMZ+89VKr/s6ZzQThfBGYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JUaaYwmovpT+jN8PGGD5XPCep5P4EtdjjQvJj77bEShbNLj2NGz1hSJndiMUhCj3BYo+aEFW7L17FYEYIcvZZfVZJGvyuOwEdLt7kkcEjExezsXtyUwYkjaK/eDiboZU67UYzH0ebybbGNUfzp8UdaFJNhFSn60wj3FMMuRA4lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=D/qQE4GD; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=VVGPE9pu3Hjs1ybDBTI5OHOIGKFR5bFbN1mFvnwBoqs=;
	b=D/qQE4GDdjXKfY5dHHErK6WRiQ3al4GeTkzzJweAb5olKz5ds3GFOepUviFVTE
	4+wwk5VrfECRDp7KiQItTBuHivlycXnykPLEk4DgH5x0/21R84UPi0+Kb7AVDDC+
	Vcttv1P6QrjmTJiuKXisiBWsgreIHN6mYntZ/0sa42e30=
Received: from localhost (unknown [36.5.132.7])
	by gzsmtp4 (Coremail) with SMTP id sygvCgBXO9VYj_tmSGeMAA--.29164S2;
	Tue, 01 Oct 2024 13:57:44 +0800 (CST)
Date: Tue, 1 Oct 2024 13:57:44 +0800
From: Qianqiang Liu <qianqiang.liu@163.com>
To: andi.shyti@kernel.org
Cc: Shyam-sundar.S-k@amd.com, Dan Carpenter <dan.carpenter@linaro.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: amd-asf: Fix uninitialized variables issue in
 amd_asf_process_target
Message-ID: <ZvuPCKyYHPl-QBZM@fedora>
References: <20240926151348.71206-1-qianqiang.liu@163.com>
 <cc527d62-7d0b-42f8-b14c-6448d3665989@stanley.mountain>
 <Zva0dBAZWpd1e4as@iZbp1asjb3cy8ks0srf007Z>
 <a69cd7b2-b74b-4ea2-9235-8f0958777c27@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a69cd7b2-b74b-4ea2-9235-8f0958777c27@amd.com>
X-CM-TRANSID:sygvCgBXO9VYj_tmSGeMAA--.29164S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUY2-5UUUUU
X-CM-SenderInfo: xtld01pldqwhxolxqiywtou0bp/1tbiRQFramb7WgDGhQABsA

Hi Andi,

Could you please review this patch?

-- 
Best,
Qianqiang Liu


