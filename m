Return-Path: <linux-i2c+bounces-12155-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C26B1B290
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Aug 2025 13:22:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82E7118A08C9
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Aug 2025 11:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84522247289;
	Tue,  5 Aug 2025 11:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NwRxyRPB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FC0246798
	for <linux-i2c@vger.kernel.org>; Tue,  5 Aug 2025 11:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754392931; cv=none; b=J8kGmooAcDRmHXy5In4aiFlbCT3E/l6qecLItXbytyidOMfnrhCjMqGDYmHDbTquEm/HIHIiJtdmHzAwSO4sduLvUzr37L5lpiAwBA0i9ha6vbxJmVnU0wekPN/SBnRF8eYAaehXRhNI3nQaJA8Ox4B+NjiDuCpvbTa4qRmQYb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754392931; c=relaxed/simple;
	bh=fnz+22BAcztbwnf5H1rfB5s8Mp90ty8ihz3z/LPcROI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=j+PEvm25G/eLAIu7H2cerHlzPTD/vFtnugC/YSwqIpOv/SKFBGlw0/W0gZURixdyB8PhbnHQXRJfZja1e342WWtOKZv1+TudA0JYIN25wMJeTm+Gsoxg5TPLld98tWNh1VLATL/sFNStkLO1KtR/N32r+lmrNl3PWJTfdbRQ5I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NwRxyRPB; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3324e2e6f54so32382251fa.1
        for <linux-i2c@vger.kernel.org>; Tue, 05 Aug 2025 04:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754392928; x=1754997728; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=50eyb5I6HYCKJkutFJNH9F3C6RMJpQa7Dd3n9eR/Sdg=;
        b=NwRxyRPB9uKVNhB8d5Fq2GLh6AKh/o7jisFr4hioRd7P0YZgIzGpkZPWTtXwwXKwVg
         PdISNM/ITeR7KO87NOKmM57EzkAG80Tbgc2QDW0DyFbqNYiWUwNSae5srjy/v/5hgFyh
         FjeJbbhU617EHJ4eJCG+xJUj+Ztl9bO/N3mX9gQEOlXz+SkRV+aYUsR4oYH3yYkqEBTU
         dtJ3WcjIBi0h2I43374qRb09/duIG0d9Bp1T8eQGCvVnTwRFDowFvx50C/0yzDPcyJda
         KohTG95MrMmzxXUHuT+nUGxlGXoDMN9FRf9wdKRC/VewjzJ17mjnpnxowSAnmqscBwNH
         twoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754392928; x=1754997728;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=50eyb5I6HYCKJkutFJNH9F3C6RMJpQa7Dd3n9eR/Sdg=;
        b=RAr8PVXIbpTBkqnGalVZUeiAQz6aYUN5p8V2hLADr5z3rJIqd3JKi4HCvt66OKtfET
         JRAhEXGWeyQyQspta/cibc34ciirFdUIijF5ZUTChqV0r/u89fBUNpcDy/amqTxkqmhx
         +jfv8RSZlIhh78cQ6Qo6jXYCRj0uz6VzvfRYBQJL1MHQUvuIC7r1Oj4k8sRYyTQjZSzN
         8GAmp+FVlcTOCnBZpd2O9CZP919kGbN694shMfqTjFXzpYMbX4fLPqcrpYm2nYY+oFfW
         Fc6OtbG3s7GH6vUSfiMIR1is4xJ+0R+I8vXoa+mx+CSFMOjilS0nx61OaFPE+dfCV1zO
         CiEw==
X-Forwarded-Encrypted: i=1; AJvYcCX+hwL3y7HflMPSm7WB2Zr6McqVwsMORHcKJm4TzWgLSP3QtlGH7wAHSpIYyqhnqFGSKAaXdmWGvyM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzN+fWg63K8+427Gk/2BhjHl3pMvCkZ5v8Q9+Q9S6MQ7b9yhl0c
	qq3cTo5iIRFBPKb7SdsOgmNf+Vyh237ow2LLMHAfG1GfNceAfFbgozpDf4Bl/p0VQ+A=
X-Gm-Gg: ASbGnculY6JSnIaclO9Ohypw9RfskpTF9FmEhMU/0IDTCdMwOpfRgmY1bbyGnW4kcST
	kj5W5JgA2ItRbOJJ5mmqufYyCwpM01GR4E44q4l7P7QCxu2t+YnFVgo106vfxzdZFGgk18Pt016
	NFu8CVLyZ6navr3VqMphufLNdX8AISQsqSUUxVgK8PTtpYJKGXXnXYfvorv8F5CHsNXsyffdmkF
	lNDKoCVldJ+WA7uMcqiBvdMkLzFJnywGKCPv2NCEcm/QtxO4+8QTNd0jtMnr03eR0PMOexIAVBh
	g/eA12cSjN/LDxbULOcQ3/aFZ/7boeIOGcsJ4Y7sjrcbOwE0tbHX2deKlvXYMnY0K6utrCpzt1l
	tf8Gf4+/4sDGsRNB++9Ovjg70yA0LXhV/kg0=
X-Google-Smtp-Source: AGHT+IG1+T/eZfmSgdjV6mJiA2OZ6hDR00ayCjg6MSwYEWhb9yK2HdnqTDMkAezcA+1OS91la6ASSQ==
X-Received: by 2002:a05:651c:b0f:b0:332:341d:9531 with SMTP id 38308e7fff4ca-3327b9157d5mr8103231fa.12.1754392927433;
        Tue, 05 Aug 2025 04:22:07 -0700 (PDT)
Received: from [192.168.17.50] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-332388d87c3sm19345471fa.43.2025.08.05.04.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 04:22:07 -0700 (PDT)
Message-ID: <b148fa2601530a1857a6ec89748a4be0e9be6b3f.camel@gmail.com>
Subject: Re: [PATCH] i2c:cadence: Handle atomic transfer quirk at probe
From: Claus Stovgaard <claus.stovgaard@gmail.com>
To: Torben Nielsen <t8927095@gmail.com>, linux-i2c@vger.kernel.org, 
	manikanta.guntupalli@amd.com
Cc: Torben Nielsen <torben.nielsen@prevas.dk>
Date: Tue, 05 Aug 2025 13:22:06 +0200
In-Reply-To: <20250717113006.4129012-2-torben.nielsen@prevas.dk>
References: <20250717113006.4129012-2-torben.nielsen@prevas.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-07-17 at 13:30 +0200, Torben Nielsen wrote:
> Since we know already at driver probing if atomic transfer is not
> working on the specific hardware version we are using, it is better
> to
> not populate the handler instead of offering a function that is known
> to
> fail.
>=20
> The current behaviour caused a failure to power off when using a PMIC
> connected via I2C to a ZynQ 7000 processor using a Cadence controller
> with broken hold bit.
>=20
> This patch fixes the issue.
>=20
> Signed-off-by: Torben Nielsen <torben.nielsen@prevas.dk>
> ---
> =C2=A0drivers/i2c/busses/i2c-cadence.c | 5 ++++-
> =C2=A01 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-cadence.c
> b/drivers/i2c/busses/i2c-cadence.c
> index 697d095afbe4..68ae60a09aa6 100644
> --- a/drivers/i2c/busses/i2c-cadence.c
> +++ b/drivers/i2c/busses/i2c-cadence.c
> @@ -1230,7 +1230,7 @@ static int cdns_unreg_slave(struct i2c_client
> *slave)
> =C2=A0}
> =C2=A0#endif
> =C2=A0
> -static const struct i2c_algorithm cdns_i2c_algo =3D {
> +static struct i2c_algorithm cdns_i2c_algo =3D {
> =C2=A0	.xfer =3D cdns_i2c_master_xfer,
> =C2=A0	.xfer_atomic =3D cdns_i2c_master_xfer_atomic,
> =C2=A0	.functionality =3D cdns_i2c_func,
> @@ -1511,6 +1511,9 @@ static int cdns_i2c_probe(struct
> platform_device *pdev)
> =C2=A0		id->quirks =3D data->quirks;
> =C2=A0	}
> =C2=A0
> +	if (id->quirks & CDNS_I2C_BROKEN_HOLD_BIT)
> +		cdns_i2c_algo.master_xfer_atomic =3D NULL;
> +
> =C2=A0	id->rinfo.pinctrl =3D devm_pinctrl_get(&pdev->dev);
> =C2=A0	if (IS_ERR(id->rinfo.pinctrl)) {
> =C2=A0		int err =3D PTR_ERR(id->rinfo.pinctrl);
>=20
> base-commit: e2291551827fe5d2d3758c435c191d32b6d1350e

Will just make a follow up - in case the above patch has been missed.
Also please let us know if there is any questions or suggestions.

Have a nice day.

/Claus

