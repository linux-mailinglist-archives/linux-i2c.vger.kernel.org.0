Return-Path: <linux-i2c+bounces-7176-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3453A98D173
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 12:41:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5204C1C215E2
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 10:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C68BC1E7655;
	Wed,  2 Oct 2024 10:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SqFGTuvX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE231E764D;
	Wed,  2 Oct 2024 10:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727865662; cv=none; b=EFfH8hbJCuGqPsSQg+i27VvJdK4t7K56YSK37ZjFGAiUyJxeXZ0Ol8DOa7GjYlNKFJSugd7Hh6TDDYG6M3Vz+re9NOH+/bgMauT/iTVt7GZPYD/Zo7vMnlqu2w5vU70itOCxTKUnh4wlD/O//TkOFPoe4UPQDp+B0TeJ3aTrsAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727865662; c=relaxed/simple;
	bh=gvCktZEtJJF77mMB4+YlCM1pW2osgHebmjJ9rKLs1ko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BGAnEu1SkHaGnaGpUFigJPIu6MujabdyAvvgD/knxNUYfRAjqRDx9Uf2lFqb+OAVNfndmd5JINa6twE2LxXbdRlplZpS7wHnNyIv2Q+OkIAha3Iie4ztjqCsokC0mDQJm4TAKioa1IlCIjnRfHzsxlh3RduPRvOH0RwuLA5DxIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SqFGTuvX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 369A9C4CEC5;
	Wed,  2 Oct 2024 10:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727865662;
	bh=gvCktZEtJJF77mMB4+YlCM1pW2osgHebmjJ9rKLs1ko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SqFGTuvXaYWtBQLcNO360jKdNJvdqcvfwX9P6C028HC47aX7BrjSThFhmzZcyDi0l
	 u14pcFKhtAXzq0XhQdMs452DCPn3AKf9pUSOy2SHidM+DKsLkP8QO+irsi/OXNNO3g
	 oTbjFtpBIB/G3RbEmza+wmVmfpYjiOJSdJhRvIgBvJR6fg2ii45AYYmGxppJn18jfb
	 Ois1vyuv51iGlCwkI+JDFDMCcSqwONaRfbb2W/UMPOhgO1BB0ELo/qstJY62Y4S9fj
	 1v7RCU20S3GSpIj00EnPiL0TwKvesgsgPkPSR/soNPft5Aar/9BYvSEXSdbU5IQA+k
	 RWddKqRG5A7sQ==
Date: Wed, 2 Oct 2024 12:40:58 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: pierre-henry.moussay@microchip.com
Cc: Linux4Microchip@microchip.com, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [linux][PATCH v2 10/20] dt-bindings: i2c: microchip: corei2c:
 Add PIC64GX as compatible with driver
Message-ID: <hcr7smlja6l3cpxjk7vn4qrxqikte4lfd3sl3ginwa4f5xauwz@wg7knjaqkbfg>
References: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
 <20240930095449.1813195-11-pierre-henry.moussay@microchip.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240930095449.1813195-11-pierre-henry.moussay@microchip.com>

Hi Pierre-Henry,

On Mon, Sep 30, 2024 at 10:54:39AM GMT, pierre-henry.moussay@microchip.com wrote:
> From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> 
> PIC64GX i2c is compatible with the microchip corei2c, just add fallback
> 
> Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>

Just this one merged to i2c/i2c-host.

Thanks,
Andi

