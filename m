Return-Path: <linux-i2c+bounces-103-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 457907E99A4
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 11:01:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB1E8B20923
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 10:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D88551BDE3;
	Mon, 13 Nov 2023 10:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZMaPYB+f"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE4C1A5B3
	for <linux-i2c@vger.kernel.org>; Mon, 13 Nov 2023 10:01:32 +0000 (UTC)
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F400010D2;
	Mon, 13 Nov 2023 02:01:23 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2c6ed1b9a1cso51128821fa.3;
        Mon, 13 Nov 2023 02:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699869682; x=1700474482; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gdsSQw38vLtSwJ9r3hzpc/W0dWcVuWj091FNrQ0Ha54=;
        b=ZMaPYB+fA/UhP50m2LUF0qGBhNzaLWuKZjRFygCgQl8ne5NfiFYtBG8I82jOHaN37J
         5NPEuRhRNIK7xgf66hyiYFuTnaaV36m28iy2ErcBSG0Qjcmvcbp7ixLwhE5L+6owcLsH
         ZDZIU8cjr+0JEkjSrRO5ithMU6TorL7kPiyGVjobO5wOlRRWTKaTrjXONdCRF9wyc+xN
         8ng7jznr7z9TH2hNM4is0wvJK0QZmmTBpQMBI8A3FaZxaNJ+r4tDW0zEcayQUriv2zGO
         dsL1+zl7gTN44AJSzwvncSf0rA4CvXc1YWSkkvjsTJS355yVaJUcZU7lk1sCGIlbxLiI
         orWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699869682; x=1700474482;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gdsSQw38vLtSwJ9r3hzpc/W0dWcVuWj091FNrQ0Ha54=;
        b=TTWmlq4N0qG5QIsOezENOzb1Nd3d57I699w7aKDuCug/cb0XnOLwThTWS5gzlVaQFN
         cv2Vg8Cde9hMF/yxq+wLRgSLa+rBkoERo6ed53LNQ+ZMdFfghHlh7ejC1bqTRrCOnjjx
         b5UD5rZwsv4l63JCp9nCXeJTr5/ELrkK649aEMYT0tV88MWL478tnxlEtL7k677GHUaG
         5SqffvG0c9BBqqJhUhN9+mft3C7G+CFOVQRhZz0S87692La0+RYMxJ+FcWJLRxSMAiS/
         3zWvPa62vo8QOLLZnOs+IfWJSGVBUdbx4AU8qdDpezKaRtsUhlPDihhCngsKHkwYVLOg
         sM5g==
X-Gm-Message-State: AOJu0YzkHll/yvP7ax7MCNAqQWf7f6lwKM4dLWK6Gzu7BCN90SkNAb1v
	SRo/Ax+tN4HVIu7P20n85J4qqmv9Qn8=
X-Google-Smtp-Source: AGHT+IEw8VoIQ18ELfNiZetCsAcr4BJZestX+7pXdLiNEt3ED9bDUfee3EMcFopYcKhp6LaH35IrxQ==
X-Received: by 2002:a2e:a303:0:b0:2c5:1603:9c48 with SMTP id l3-20020a2ea303000000b002c516039c48mr4773031lje.20.1699869681895;
        Mon, 13 Nov 2023 02:01:21 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id e17-20020a05651c04d100b002c50ba4a047sm934976lji.80.2023.11.13.02.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 02:01:21 -0800 (PST)
Date: Mon, 13 Nov 2023 13:01:17 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Wolfram Sang <wsa@kernel.org>, 
	Jan Bottorff <janb@os.amperecomputing.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] i2c: designware: Fix corrupted memory seen in the ISR
Message-ID: <tupjmogut45oh2t2cth7o5wpqc6u6qkwfwddqrfnozlpplavlz@vram3ul3t4zj>
References: <20231109031927.1990570-1-janb@os.amperecomputing.com>
 <yuperxjytpcwz25fofjut2edzjc4i6jgymcraxp4q6mfe27taf@b33ym5iuubji>
 <ZVHxhN+dxJSUkEOg@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZVHxhN+dxJSUkEOg@shikoro>

On Mon, Nov 13, 2023 at 04:51:00AM -0500, Wolfram Sang wrote:
> 
> > The patch has already been merged in, but in anyway:
> > Tested-by: Serge Semin <fancer.lancer@gmail.com>
> > Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
> 
> Thanks to a restrictive hotel network, I haven't pushed out yet, and
> could still add your tags. Thanks!
> 

Awesome. Thanks!

-Serge(y)

