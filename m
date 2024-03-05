Return-Path: <linux-i2c+bounces-2192-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E0A8718AB
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Mar 2024 09:54:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F44C281F70
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Mar 2024 08:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EF8F4E1C1;
	Tue,  5 Mar 2024 08:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ykC1jEUb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DEB1EB4B
	for <linux-i2c@vger.kernel.org>; Tue,  5 Mar 2024 08:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709628867; cv=none; b=q2VbtCW0Z6qDSBkJRg0TxJ+tZYDIxuAS5Dg8GRt6B8xcDwqoO+5x9HsPPqBVygZCTAmmFBldTJKdAeNW7WpcaSvpDRUfd5dTibCOGRJWcAAHXF1cYJgOI4ZgNWKD1StwowrLwRsxuOkMZyaxpmVJ+2HMIiw+g5NQbrX1GYN5Cqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709628867; c=relaxed/simple;
	bh=Tt+7JMYXpo3GUci8dggYApH6xD1h940JbVnL1Hrs61o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SeRxB6NvQtiHZGQEHpQ+/OMO5GaniMYdaydhwYXiuzQAeFv/b2bEWBXMfEd6CkD2f8m0AJOGOJ9O/AqiA1apacajh344SEejiqaF0/DqQbyBbWumNPLjRLcdd13fbTgpAxR+WDzFm1i9/YLw6vnayyi8XOHsB3gHdyhklCF7Q7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ykC1jEUb; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6099703e530so17965547b3.3
        for <linux-i2c@vger.kernel.org>; Tue, 05 Mar 2024 00:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709628864; x=1710233664; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tt+7JMYXpo3GUci8dggYApH6xD1h940JbVnL1Hrs61o=;
        b=ykC1jEUbwEG84NcGTkMXYnVLdIEPHERi3MCif4WxWLJdtigRD4mu9a39k2K3Bur8wD
         i9H9ajjO7N56njR7XmIloQNeY8Jj1QOO72zvVRdByvV+bdak24uxR3e8u9mVuuKmPf2p
         P2+01NkKoOJgTZAIykLB3dquR9xhWb61jh3OoBNIAj4MR8YmlEzAA90aGnoRMA5jDq1S
         eb4dZPshJfIAlAHzZ4FVdZblsIaErfBz+xGxpL9n99IuB4SOIFlRbnMqmWw4Brfs3tov
         HV8mPjzb/TJFwdLBmtjT8Myhjn43NVmkYXKnwwcbk101cgyApnzsqEcHBWIYkwR4galh
         /VHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709628864; x=1710233664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tt+7JMYXpo3GUci8dggYApH6xD1h940JbVnL1Hrs61o=;
        b=Y/Bx+MONYKoDNyM++9b9fKMtSvG4KmuqYbXe0krPISDurRgqLA/W/Wxfxz6pNrLESS
         nGE+DlNMOF7cDa2Edsqgg+CwPqIyvhVBTW8DrVh8XON+w0CLgcNQBLcRQEHmxPCrzPe4
         P9DhcqYw/XCX4jlr5ciadL1ww+seO1OXWmtrnnWY4WQuNqNwcuJ8PjZ4UozBRzZ5cxDo
         fg0DSp8t8+sG+2rZxC4SWUW8ZAVZbiwPFHLPj0RnjzHpLXFCQOPfMib4l715p8UC1Y54
         bGrsL2QqIwduRg72qh/bRrjU3IqWnfHih3xEutjFTneAr9OS/FgniLhJaOa9whY3SMe1
         VSuA==
X-Forwarded-Encrypted: i=1; AJvYcCU1jlHdvgMZ32GUXx1AVy3eBlIBS9APGqDddox4HMLCRl6FGR7hXDHlez+bayN1WNV60sE2hkRqy8wiX6IDe2TSQRs05y0nJEb9
X-Gm-Message-State: AOJu0YzQRlCEYzBOcs/GUtUVDUOxEa+yVVSzyQzfsF59QMt6aqIAMcVy
	HasXfZ6Qf7PbCpDEKYcGafcu3Jhpc9VbWC9dHQTTn20Z1p5+9NblQSXMEL3v4B9vNqMH/X83JDf
	geM3HGNFqhEecNnC159awIK5G1hN//0DIhtdOfg==
X-Google-Smtp-Source: AGHT+IE/wIsD6whHKJKfkYxUjTFX3sEvs4a2vC0xB5fxbgPf8pv6vGgHZTJfQZ32WX25ffakwJstdqP+bIRZWVmkQJQ=
X-Received: by 2002:a81:52c7:0:b0:609:cedb:8d8c with SMTP id
 g190-20020a8152c7000000b00609cedb8d8cmr322729ywb.11.1709628863876; Tue, 05
 Mar 2024 00:54:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <8d35529d-8ba9-4bdd-a3a3-00d67ab6f2d5@gmail.com>
In-Reply-To: <8d35529d-8ba9-4bdd-a3a3-00d67ab6f2d5@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 5 Mar 2024 09:54:12 +0100
Message-ID: <CACRpkdb0WDyK7wnJ-z9KWteAp_epnfyXShGB==tzoVZxG9i0Dw@mail.gmail.com>
Subject: Re: [PATCH v3] i2c: i801: Avoid potential double call to gpiod_remove_lookup_table
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Jean Delvare <jdelvare@suse.com>, 
	Wolfram Sang <wsa@kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 4, 2024 at 9:31=E2=80=AFPM Heiner Kallweit <hkallweit1@gmail.co=
m> wrote:

> If registering the platform device fails, the lookup table is
> removed in the error path. On module removal we would try to
> remove the lookup table again. Fix this by setting priv->lookup
> only if registering the platform device was successful.
> In addition free the memory allocated for the lookup table in
> the error path.
>
> Fixes: d308dfbf62ef ("i2c: mux/i801: Switch to use descriptor passing")
> Cc: stable@vger.kernel.org
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - cc stable
> - free memory allocated for the lookup table
> v3:
> - cc'ed Linus

My bug I guess, mea culpa.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

