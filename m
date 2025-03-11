Return-Path: <linux-i2c+bounces-9798-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D85A5D31C
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Mar 2025 00:23:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7E29189B1E7
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Mar 2025 23:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7C0821A427;
	Tue, 11 Mar 2025 23:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lOI6JqMg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95CC1D6DBB
	for <linux-i2c@vger.kernel.org>; Tue, 11 Mar 2025 23:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741735415; cv=none; b=SrcxK850B5NCkNqlSGt1/rvETWdqz6rUmhPtBR0pRxShPB6AkV/F4lX18WfWT84lmqSrSQhJwtWerJtoXmSnEhU1GFcVmn2Tjd2+6Xyu/Yq1bM1qBDF1/fckUbj3DtPo1RYvHtZNkzYK8XEbtANEEN4CKL9Fl50Q54mV9u2lxtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741735415; c=relaxed/simple;
	bh=SHveKALUEKLClVXHNJJrVvWi13OUmbth/QGi7mo5yOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YPYh/hVPEn9Ti/X58Ewg4KEj1JdBldIkfxJuFj0HappyeU8iOXv+joYGkFdnTcPqVqnavDp1pmHMOkuayBLdElKySSiMDex/9zpkv/EmaGwXrixG23RQ6O5FgI8kQr621zbk2RN9KCEjXSsMlNwspRMruXX1it5eWshwB3RdblA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lOI6JqMg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A273C4CEE9;
	Tue, 11 Mar 2025 23:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741735415;
	bh=SHveKALUEKLClVXHNJJrVvWi13OUmbth/QGi7mo5yOM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lOI6JqMgQMLs7i83bLscYAVJMgnJMgRTAkKBmIne60rJf3eO/c8bIN+ixB8UV3Ren
	 X8QH1bpQi74pyjiMyv2abYPpo1HPQpUlQXiFvQNadAtJfrthsgqxVfQYKktvYRAkca
	 Wh1ekTBj3V+UG1KmsuwFXQZPqHqPejIE8rsIcCZoSVTZuOcfmKpD4WdwN8WxN/XWHd
	 A9aa+17ReNSb/ZkIwQvcffg0jgDg3247+v03U59TaYgskydnzLtTPoWhKB+gT3tw23
	 TafZR12wjELXa3y1qQs61tR6ZEDbkt0W9EvZsTEbfIOZNPW4tc6RUbDUHYH8B/EqOF
	 6MsiuvSZWHhXg==
Date: Wed, 12 Mar 2025 00:23:23 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] i2c: i801: Avoid potential issue in
 i801_check_post and cosmetic improvements
Message-ID: <rzstdpubrwruwuzuex6txokvweazhc7rxdgu5rlaklebb7ifps@zrwmkceg2zo5>
References: <f620328f-1e0e-4875-916b-544181a13f0b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f620328f-1e0e-4875-916b-544181a13f0b@gmail.com>

Hi Heiner,

On Fri, Feb 21, 2025 at 09:27:06PM +0100, Heiner Kallweit wrote:
> This series avoids a potential issue in i801_check_post() and
> includes smaller, more cosmetic improvements.
> 
> v2:
> - rebased

Thank you!

> Heiner Kallweit (3):
>   i2c: i801: Cosmetic improvements
>   i2c: i801: Move i801_wait_intr and i801_wait_byte_done in the code
>   i2c: i801: Improve too small kill wait time in i801_check_post

merged to i2c/i2c-host.

Thanks,
Andi

