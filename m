Return-Path: <linux-i2c+bounces-9892-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C360A680C0
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 00:35:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19C011899181
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Mar 2025 23:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B9FF207E04;
	Tue, 18 Mar 2025 23:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ma8z723P"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93E7205E36;
	Tue, 18 Mar 2025 23:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742340897; cv=none; b=OrU8c+/ncZLrrc97W/vsdwwi7ZMWe4Ro+TEYphIzF/iW6qOXWv7t48e9xL4P01hedtL0oKy8DBpDSEgwLRMIk4VRdxJbJohICCYr5I3uJ+FsM3QGLTlZSRywKZDn1+nJl4Ruz8BXbYFhK4a0AeO1cxcawTB8DE/w21VD7d+2Rd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742340897; c=relaxed/simple;
	bh=pMn93BCYx8Yd/sNKAxUy368DN98GPccSOpgU0WBYfvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ASZGX0mEhLDQb3UcJuU7i/XI4IB7t4pH0AxQAPmAYkrYQN4mfa+uTXT1i9Q+k2MpdA3XgoC7PvPqXioVIDalJ4GndKUj3rN67DWv9cf3zR6JumxoIIYwv8q9yy8O/rqAfsRGUjLsfnsGqRajexjthb7DR0zteIUfdv7xexPUIkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ma8z723P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3461C4CEE9;
	Tue, 18 Mar 2025 23:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742340897;
	bh=pMn93BCYx8Yd/sNKAxUy368DN98GPccSOpgU0WBYfvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ma8z723PtjSDzA2o+p77HmCpTJX4ju6WX+CjS6LUcxG96CpWq32+ZfhY03OVdZfxP
	 SqKNCq35x5v7tsPOfZk1UZWc/yR5hUCAZOhyRu0SX4PuASaXrMhyOXcj9a6mxsE0X4
	 v6LM0d0mnjjVgklNNskiyKXvuHHtGZt8OLibTuDWSzuCJMcxywDRqUju9giscYQhU5
	 Q2lJK/0ZqX92Vh7zurs+49Bnvs0XW2o/6CeO5KvqPffQXRObGesnQIcEBHFICqXnk/
	 HP03ZRR3JdFb3n2PiowiQXCu/8XXXDvcXuM2qqIqzeqD7/0EDwIHsJRS0PLzrJOQND
	 u6/KFxAn9xSRw==
Date: Wed, 19 Mar 2025 00:34:53 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Zoie Lin <zoie.lin@mediatek.com>
Cc: Qii Wang <qii.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, teddy.chen@mediatek.com, 
	joseph-cc.chang@mediatek.com, leilk.liu@mediatek.com
Subject: Re: [PATCH v5 1/1] i2c: mediatek: add runtime PM operations and bus
 regulator control
Message-ID: <fqicrglyug7gmkmysok7hilhmkyhxmnkztzv4iffgry6xce6t3@2i6b2ihfu4rb>
References: <20250314145407.2900190-1-zoie.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314145407.2900190-1-zoie.lin@mediatek.com>

Hi Zoie,

On Fri, Mar 14, 2025 at 10:53:43PM +0800, Zoie Lin wrote:
> Introduce support for runtime PM operations in
> the I2C driver, enabling runtime suspend and resume functionality.
> 
> Although in most platforms, the bus power of i2c is always
> on, some platforms disable the i2c bus power in order to meet
> low power request.
> 
> This implementation includes bus regulator control to facilitate
> proper handling of the bus power based on platform requirements.
> 
> Signed-off-by: Zoie Lin <zoie.lin@mediatek.com>

merged to i2c/i2c-host.

Thanks,
Andi

