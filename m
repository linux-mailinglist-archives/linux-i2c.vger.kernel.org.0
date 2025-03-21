Return-Path: <linux-i2c+bounces-9966-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31419A6B24E
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Mar 2025 01:34:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B15CD881DF9
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Mar 2025 00:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47EA01CF96;
	Fri, 21 Mar 2025 00:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TbtkBtFA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D1B3232;
	Fri, 21 Mar 2025 00:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742517247; cv=none; b=XhggKjvD1h44o0HeflLg180aCdlnsUqSC1hZ/SGPIPIvjeWMJ6UbsBkbwjzwssE2Z5Y7KGrmKb4bHV4i9rlSKpRLFAqoX6rGtmvujRQPeUmbV5KMU/5BQx9d509ry2xxas2uwtei7qsbRQQPm1Mb+uf1o2zVKVtEjmtLAvPQPGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742517247; c=relaxed/simple;
	bh=yyQrlBhrG3F+CCOPI4mDErllZmAnSGt+UetzoQZbtuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i3sLIv07LmTY4NKReoMVZYEMwwYvMS9SBLIe73xIdf/SmUE4x3vA6Bx833bVy2KnbXWAKHKlS731kZWbLUVaTEK6wnXNQWU6+XuwlmdGvorRuwZh1UH5h4f3e9dWQbuAP18GeRhWnAycXhsjV9g2STr0a1hVCgzXZQ1f6d+JUhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TbtkBtFA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7EBEC4CEDD;
	Fri, 21 Mar 2025 00:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742517246;
	bh=yyQrlBhrG3F+CCOPI4mDErllZmAnSGt+UetzoQZbtuU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TbtkBtFAT2D4XbiiWv7EtfXCZHZmACPrbsp8E90MTGOBZa+L6qybBpWgWh+s/L/Pn
	 xAkvRRfYPgHesPEru6KNMpajOe8flK/60o7pqolcLN2Wgx0895H5clX114AecJIOhX
	 sG2p8e5sRtBWje45/o6WyWdQ3sb0WFKNcZ3CThJOTO9AhCeEae60lBU1JRDM5Dvwtj
	 JPxN7b6fcN6Zfa2rf7WiwcgJJMTeCeL73yItD+I1fFqTt6ppGO7d3vFVGnVscdAb4l
	 aFRAloY0t1b6BzB0sMdm0uAQYPaZ/uUL5jPXIV4VUKbDGScbSy7udzH1nggyPWtw/x
	 yBcFFsod1EzeA==
Date: Fri, 21 Mar 2025 01:34:02 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Zoie Lin <zoie.lin@mediatek.com>, Qii Wang <qii.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, teddy.chen@mediatek.com, 
	joseph-cc.chang@mediatek.com, leilk.liu@mediatek.com, John Crispin <john@phrozen.org>
Subject: Re: [PATCH v5 1/1] i2c: mediatek: add runtime PM operations and bus
 regulator control
Message-ID: <em2y3tkiwlxc45f4sjtzdd3oy4v5zpqgdpqfppyzah2ilzidg2@wn6cnrezygpl>
References: <20250314145407.2900190-1-zoie.lin@mediatek.com>
 <fqicrglyug7gmkmysok7hilhmkyhxmnkztzv4iffgry6xce6t3@2i6b2ihfu4rb>
 <Z9yR6pyg1mtqKynh@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9yR6pyg1mtqKynh@makrotopia.org>

Hi Daniel,

On Thu, Mar 20, 2025 at 10:08:42PM +0000, Daniel Golle wrote:
> On Wed, Mar 19, 2025 at 12:34:53AM +0100, Andi Shyti wrote:
> > On Fri, Mar 14, 2025 at 10:53:43PM +0800, Zoie Lin wrote:
> > > Introduce support for runtime PM operations in
> > > the I2C driver, enabling runtime suspend and resume functionality.
> > > 
> > > Although in most platforms, the bus power of i2c is always
> > > on, some platforms disable the i2c bus power in order to meet
> > > low power request.
> > > 
> > > This implementation includes bus regulator control to facilitate
> > > proper handling of the bus power based on platform requirements.
> > > 
> > > Signed-off-by: Zoie Lin <zoie.lin@mediatek.com>
> > 
> > merged to i2c/i2c-host.
> 
> the change causes a crash during boot on MT7988 which typically uses
> one of its I2C busses to connect a Richtek RT5190A PMIC.

Thanks a lot for testing it. I removed the commit.

Andi

