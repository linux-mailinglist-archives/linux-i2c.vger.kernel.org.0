Return-Path: <linux-i2c+bounces-9787-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B16A5A5D25E
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Mar 2025 23:15:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68B75189CF8C
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Mar 2025 22:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1553D2253BD;
	Tue, 11 Mar 2025 22:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nkc5t/z7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B4E2F28;
	Tue, 11 Mar 2025 22:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741731347; cv=none; b=ZXaYPam5ACH6K65lvXvdhZ6chi5k4jFkViPLCVQjHqnBZkpMiIOIr+iVUZInW8UIya66iE/5Ov3aSJCc7OOdP3eNE3LoKWulMdM31Or6WZInNY6HJl9aYA+A8DgJsyFU35PsFGDhvGq7rg3nlkIvohJogeofhEjzS/XmKI9H9mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741731347; c=relaxed/simple;
	bh=SRFNaVjROWG5Dt9gNTjWV0ukYRS5OSkz9zoqD9zJvQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bjRqcWEKFBlytYCrnjOwh6I0ls3fT33npY+m9pRbmb6GFn4wpSfjnnM4ronWZrYSLPDvF+EO3pqLTgCrjug0nTUPKig99C58A1/tuBcF675f5Y2Ynzvx4JgC/zXjHUUZkYdBeYBI/s/Ra2oJU/aJU55aWlkoHbYDTa26AvxZF5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nkc5t/z7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E6D5C4CEEA;
	Tue, 11 Mar 2025 22:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741731347;
	bh=SRFNaVjROWG5Dt9gNTjWV0ukYRS5OSkz9zoqD9zJvQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nkc5t/z7RY2QR5Ik5Tg1u8IdSsNhnI7b9xV/r1LDicUHJVDUabklDzPXoQ2m4PJMO
	 8+pMJfQewardsCgHqZHUOWFO887YZcqN7DNWE1LJsbradfwyBDg2m4+e6zSQy3EUxb
	 3sD3ccIyer3qnYxuljxjpyKH4AUqXnJ1ygKZRmSai15iYHky9jSBYDFqexYtsUjOu6
	 ezfVKGvL2ra4m8g8+0mJd1nasX+bgDrFHdjMvT0le0i7hOUMos107eoz5nBwIxzdL/
	 xK/HWJfxfyVXrDpTw6oVzZ8CdEQH6EF4L+jkdys6Lndh+RywDb2vJY81GDIH71Uesw
	 +ZkIltjpXPgUg==
Date: Tue, 11 Mar 2025 23:15:38 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	"open list:FREESCALE IMX LPI2C DRIVER" <linux-i2c@vger.kernel.org>, "open list:FREESCALE IMX LPI2C DRIVER" <imx@lists.linux.dev>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: i2c: imx-lpi2c: add i.MX94 LPI2C
Message-ID: <oyjjcxuqki47gruavd2ms5lc4z2mawbdwjd2mwwxss2tq2xqm5@m2ztzpibjrkv>
References: <20250306155815.110514-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306155815.110514-1-Frank.Li@nxp.com>

Hi,

On Thu, Mar 06, 2025 at 10:58:15AM -0500, Frank Li wrote:
> Add compatible string "fsl,imx94-lpi2c" for the i.MX94 chip, which is
> backward compatible with i.MX7ULP. Set it to fall back to
> "fsl,imx7ulp-lpi2c".
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

merged to i2c/i2c-host.

Thanks,
Andi

