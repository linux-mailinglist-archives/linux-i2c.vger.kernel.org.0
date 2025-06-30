Return-Path: <linux-i2c+bounces-11713-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 293ACAEE70C
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Jun 2025 20:58:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8478716EE44
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Jun 2025 18:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E0A8291C30;
	Mon, 30 Jun 2025 18:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qMZJITWb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385A21D63DD;
	Mon, 30 Jun 2025 18:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751309910; cv=none; b=hl77WfPHTPmXodiBZvh2eHUhQA2yojZ0B+gCqgqboIqKMA7P9vGZ95zLn28TeRDFLL7RGMGWhsZUZfB1qZ4tX84cMuUPF/i+SOHWke01KnFp/aXZJDAyoUPvxRtkpIm/PNIm8EI1YzW8k5reemIEAnRiDPpHLewLB/LIgEfOLWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751309910; c=relaxed/simple;
	bh=tKjiX/OsAFGvd34aQYUYPgAligk1SLjHAffiZYOW8tM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pfBfLK80Dwfo6qiaS/OW65EeJQAUmNffJnephxFuKfwvRdNnq6Weo27kIW0FvF+TnqY2fGP9tGbnuLM5EA4e616rCSYt/sXCuBHWpxC9ptvd3GimbmI/sSeflXmWYongX83DUBb9pK5uK5n2E2hmivcwtIWQocUw0NKWfLz3x00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qMZJITWb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FB72C4CEE3;
	Mon, 30 Jun 2025 18:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751309909;
	bh=tKjiX/OsAFGvd34aQYUYPgAligk1SLjHAffiZYOW8tM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qMZJITWbUUXnpNZ5EoP8k7w0MKjK7fRPkyVG+KKbl/EQnf1GoYoLQPVzJW/rQwpcI
	 ddZ3FV7bXaQhVwCh4N9vKHtgFGoeQE0RnrBCcTThnJ3K+01G9IMjCvvgZbcZq7+vE1
	 CaNZI6UBSNWsS7ZxUAr7NiFuQ89uPcPZ7mrcx3RZJIxydnzABlvR/9M8Ww3hn8HTRd
	 FCkEeV/hlPk/0Os761MbsIuREkMSuliaxkqRtbPVP6Z8CpU0JCThTrp37Fi85+9kf6
	 LtGi+800bkDydPsiE88f5hT2qR0q5cl+wJZzix4ukuuDgMxDH/zIw5+xYNeYZVIaLp
	 WWoPSilrvJzSQ==
Date: Mon, 30 Jun 2025 20:58:25 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, 
	Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, Raag Jadav <raag.jadav@intel.com>, 
	"Tauro, Riana" <riana.tauro@intel.com>, "Adatrao, Srinivasa" <srinivasa.adatrao@intel.com>, 
	"Michael J. Ruhl" <michael.j.ruhl@intel.com>, intel-xe@lists.freedesktop.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/4] drm/xe: Support for I2C attached MCUs
Message-ID: <ojw26xx2kibh4pheo4rlsgqrtlevbz3ojyxlv5byuetqavpgaf@vms7jyksajrl>
References: <20250627135314.873972-1-heikki.krogerus@linux.intel.com>
 <20250627135314.873972-3-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627135314.873972-3-heikki.krogerus@linux.intel.com>

Hi,

On Fri, Jun 27, 2025 at 04:53:12PM +0300, Heikki Krogerus wrote:
> Adding adaption/glue layer where the I2C host adapter
> (Synopsys DesignWare I2C adapter) and the I2C clients (the
> microcontroller units) are enumerated.
> 
> The microcontroller units (MCU) that are attached to the GPU
> depend on the OEM. The initially supported MCU will be the
> Add-In Management Controller (AMC).
> 
> Originally-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Looks very good.

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

(sorry for coming this late, but I've been on and off in this
period. I would have definitely loved to help on this)

Thanks,
Andi

