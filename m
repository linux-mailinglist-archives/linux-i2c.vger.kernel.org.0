Return-Path: <linux-i2c+bounces-7184-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7713A98D402
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 15:08:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A918B1C21351
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 13:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F4EA1D0407;
	Wed,  2 Oct 2024 13:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ScmohUsj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5111CF5EE;
	Wed,  2 Oct 2024 13:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727874494; cv=none; b=Awj9LgoqJrX0DFglJ5pCoZUe0MMR33WFlb1zYONyMdXfP1hhm058PcGzwcUtNKZ7pWv+Gun8qTz1Pv8O14lIW7j73c3YrSLELgUyFcz1pRCPV6Hhck2BjFVKzDo6fTkoWmWlHYR1vMyIqLhwfi1BKGkpb2bUzBpyk1Xyu/2FazQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727874494; c=relaxed/simple;
	bh=ShT5aGq5RD3zJbBHa6K4AHTJryxZDp+SxPpWVZtyqGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L/cbeELPgp5PN2VpVUtKLhKXXG38+3NtyTSKhmwkmRPk6oEmV7A0SaV9GG3GG224XwUzG7U6QrXd0sHsvPZs9UkesXAtd494QnGRjo0rInhWXiMmBxs7evNiTaddciq+PtrqT/TLXk2V8irRXYrmJe/XHQPyE596tqEykFy9ohU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ScmohUsj; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-37cd5016d98so3466799f8f.1;
        Wed, 02 Oct 2024 06:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727874491; x=1728479291; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d+vo+CngfnFXF6+FSmqK0SlB5GNZMtMWx22seKJwNuI=;
        b=ScmohUsjbnm8vPxvB2s3H5ikWOpAjuhmgRa8dMzZ7nvIAB8P57Of6dCveHBF8Gbx8s
         81M7o1OpYbr60XjL2qOCaR+ptUcWFzbtd85/x0EKemIzo1ch9T9+NqJoDygASEr4ht4r
         70sljC/Mq5xlrWldT+WkxWk8aelvi0bTNou96tSZloKhEJONP/R0LnbwH85bGMCUJIhA
         K0+SmQ5HFgzsM6dYr/2zns29qjSvv9ib3YJoQNG3/q8FObZ0mHkejrMYjewjdg+3aDhy
         SU7765pqXlFF/DTsL+mm0p5q7TCfmMNaHq3/csWUYwuHyEcq/dzNL44bjUYHoPxJJ7n0
         EpkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727874491; x=1728479291;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+vo+CngfnFXF6+FSmqK0SlB5GNZMtMWx22seKJwNuI=;
        b=UQG7heQnYPx+q9Psi+phR1xTbULrnQV6xKszoay9JDDEZ04mBclkSC+EATESzD7JB6
         E2Tu9dqeDfbweV1X/dyMivUYSe66OzuHEYJMn9LifEyp3uXWamc07dWITSEc2oABMb3O
         bJk82a7TLFOaepvUIiK5KvGt4zco7RKJopYUH3+u/yT27qwwuxs6VapIP8epds35xiSw
         QfpyokQjpPosK+8LBqVH+weP1ZEOPWiG6eI3csDq+nfnn8n70YVVsTM2kJ8gSJcbO82N
         Fg4qAq/mb/QCe3fHz+eRmF7eOywRMsJCSfJpVitFKc+OJiELTkMNppHQMEjP9CWKQtUr
         wyew==
X-Forwarded-Encrypted: i=1; AJvYcCWBMW/OAG97j8GUI06AT7GhFUrl+gUR9PF7hH0PjuJdgGpvwKUzW7CdujQxmeHEdCNa7rfM3jhoVPyzGACL@vger.kernel.org, AJvYcCXyMn9Ce4kU3mRQ5v3ByL9qCLOp284reWwwkn1fzqEX9WAeFm/vQn/khAgbbhMYCHBR1xdxdh4LI/4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWWSmSHP5ZCzaKAwsc8PxVkgKbbiuRqm5qMnhndbOfwtzxf4E/
	URKl7+VtzkDbtTMnMyy078yp7vOpzbN+1bZsGtlmOiK2GUXz8nWsE5SgSQYB
X-Google-Smtp-Source: AGHT+IF9FentvtlBTj0QFbrVHmGbx05S13YBVweR1DdtG3DoyI9laTrIrlgQf/nES/TeKn6ouzVbXg==
X-Received: by 2002:adf:8b5d:0:b0:37c:c832:cf9c with SMTP id ffacd0b85a97d-37cfba1239dmr2358739f8f.50.1727874490800;
        Wed, 02 Oct 2024 06:08:10 -0700 (PDT)
Received: from eichest-laptop (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd56e6488sm13956736f8f.46.2024.10.02.06.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 06:08:10 -0700 (PDT)
Date: Wed, 2 Oct 2024 15:08:08 +0200
From: Stefan Eichenberger <eichest@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: o.rempel@pengutronix.de,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v4 3/4] i2c: imx: use readb_relaxed and writeb_relaxed
Message-ID: <Zv1FuHlpeayZq-Zv@eichest-laptop>
References: <20241002112020.23913-1-eichest@gmail.com>
 <20241002112020.23913-4-eichest@gmail.com>
 <6b070948-cf02-4f13-a220-0f6cfa21c41a@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b070948-cf02-4f13-a220-0f6cfa21c41a@app.fastmail.com>

On Wed, Oct 02, 2024 at 11:51:22AM +0000, Arnd Bergmann wrote:
> On Wed, Oct 2, 2024, at 11:19, Stefan Eichenberger wrote:
> > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> >
> > Use the relaxed version of readb and writeb to reduce overhead. It is
> > safe to use the relaxed version because we either do not rely on dma
> > completion, or we use a dma callback to ensure that the dma transfer is
> > complete before we continue.
> 
> I would still consider this a bug in general, you should
> never default to the unsafe variants.
> 
> If there is a codepath that needs the barrierless version,
> please add imx_i2c_write_reg_relaxed()/imx_i2c_read_reg_relaxed()
> helpers that use those only in the places where it makes
> a measurable difference, with a comment that explains
> the usage.

I added the patch because of the following dicussion:
https://lore.kernel.org/linux-i2c/ZpVWXlR6j2i0ZtVQ@lizhi-Precision-Tower-5810/

I can't determine if the relaxed version improves performance. The
'normal' version worked well for our use case too. Therefore, dropping
the change would be acceptable for us. Another potential solution could
be to use the relaxed version only inside the ISR. Would that be an
acceptable solution? What is your impression, Frank Li
<Frank.Li@nxp.com>?

Regards,
Stefan

