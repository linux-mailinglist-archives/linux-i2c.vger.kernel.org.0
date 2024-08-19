Return-Path: <linux-i2c+bounces-5507-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9082E9568F1
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 13:06:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45ADA283F63
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 11:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 192E0166F03;
	Mon, 19 Aug 2024 11:05:41 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5103914C58C;
	Mon, 19 Aug 2024 11:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724065540; cv=none; b=nTYvbaJDkpKiKFdpzwX6RqJtWyjoQORg9Bif1nuvc47ulFOPA5zECx0updD1t/bBXxrf9RsH9DVSfZTERG0UJz9DVl0IWDQGX4ur9zu6OasSti1buss3mVNTs6SEeO5UgnGRc4X1l8BZr2S5+/QRVM5+ndLWqZJqJVCApF8AwAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724065540; c=relaxed/simple;
	bh=VFH8HUZ29AQm0Ucp2C4NxWlGvxZYB56U2kc3J8DN6pk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n8zvfQ38UkMgKurAycNoTFMWt80NuCURSmF1BIn7Xg3I4zhRlsTejwf+iwda85ESBP0RbEsVZqJFIs1xeQx14Mqi1cmBC2tzw5r0EPzQ4Ur3dsql5aoE2/TshgKrjPQ7fS+ZPCtl24qqiq1yXp3XU4HVEQ/4xtlAIQkFqXlznnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-428085a3ad1so36677975e9.1;
        Mon, 19 Aug 2024 04:05:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724065537; x=1724670337;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4n8UrFl7hY0dNCEt200dSnyI6lwLng5ZwG8MtnVY1Zs=;
        b=oTa0trWpyNdXMABR9EpWVQ079QvRbklhMJ7/0oOCMpwGaAkdGAZnmc+hl6UzqezaF1
         IqK9W0zt8bl9EvyglNk6MmDjZavhszScU7vTLIVii/ddTmc9dMYg+xwmsrc8v0HPQTBc
         ot5DYhvCcNbsZR0WtYdX78EHsyjjrOyKHsEK9oJLO/gD5dFP8iT4ml54jrHhLbMeG+5N
         FZ9Cjx7TPd5er1T0TaoTF8G6NvaiVWsluD1TInQnhIVp5ZA8etigvRO6kMIyfN+0DHUf
         CTJU6ILzdi4lJFuN6exkMxjg4YyPcrwuQ8XTPAzmpX74mA4No8ZwVNvklf+IBXVrulfd
         pG1g==
X-Forwarded-Encrypted: i=1; AJvYcCWfUw/t9xl9qF7HKmFK5TYnPKuLbJgrxEmjj7kgULerM7py6wNRA5+TbPndzH9UYXHU57JD2zKpTanr+DWxVpu/ZErC6Mx0FqYKrwTJQxG5KCEGFuMZxOdd+0POsYgeSkGNResXg3EaebEe8mqGUAGzuOSSvL4jSTHs3P7IaAE8Y0owdC+s1CeZ1dMPq7J9GC3LBith+1lWFaauPUwb96sD42+JPMpt
X-Gm-Message-State: AOJu0YyWBXqFNvkaIUWG8N5GXIGiLfq24ZPtVOiixLtqsnLhswjfoqDW
	kaYi/df64zTzZBoRDzWxIE//+ckl7yJvO8kQ9IgCRCcB0+/Ou6zY
X-Google-Smtp-Source: AGHT+IG9PA/97yKff6rI8m4c2QrpPkNFbQVAmnRlQ5BPtx5qXzqf9rkO1PPX+ipCoUODBPhhlB4laA==
X-Received: by 2002:a05:6000:1286:b0:36b:c66a:b9fd with SMTP id ffacd0b85a97d-371943150dcmr6506066f8f.6.1724065537091;
        Mon, 19 Aug 2024 04:05:37 -0700 (PDT)
Received: from krzk-bin ([178.197.215.209])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-429ded180dcsm160618835e9.4.2024.08.19.04.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 04:05:36 -0700 (PDT)
Date: Mon, 19 Aug 2024 13:05:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: chris.brandt@renesas.com, andi.shyti@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, p.zabel@pengutronix.de, wsa+renesas@sang-engineering.com, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v4 07/11] dt-bindings: i2c: renesas,riic: Document the
 R9A08G045 support
Message-ID: <gxjlmdjicwzlexitsx673beyn7ijuf47637nao2luc5h6h6hvi@qstobttin7dw>
References: <20240819102348.1592171-1-claudiu.beznea.uj@bp.renesas.com>
 <20240819102348.1592171-8-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240819102348.1592171-8-claudiu.beznea.uj@bp.renesas.com>

On Mon, Aug 19, 2024 at 01:23:44PM +0300, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Document the Renesas RZ/G3S (R9A08G045) RIIC IP. This is compatible with
> the version available on Renesas RZ/V2H (R9A09G075).
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
> 
> Changes in v4:
> - added comment near the fallback for RZ/G3S; because of this
>   dropped Conor's tag

That's not a reason to request a re-review.

Best regards,
Krzysztof


