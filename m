Return-Path: <linux-i2c+bounces-2910-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B45258A27B5
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Apr 2024 09:11:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 30135B218CE
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Apr 2024 07:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE42144C8F;
	Fri, 12 Apr 2024 07:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NtfY6v6C"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49165C2FD
	for <linux-i2c@vger.kernel.org>; Fri, 12 Apr 2024 07:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712905895; cv=none; b=MoUQt1OXbZYBH722oI4FU5BC0hvgrQUJhLbwLYd1atTMoDGIoE3u8gFkNDjBnnHHOBLfhgoko2PkhpKVeczSDSXKUxk9TWAftMHpKI/+7snZvIVFCXOIls3GFHaTu5QWByM5CvZNqgsZj+l5zF8TEsqW6vEHhgzhkc64c7OwjsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712905895; c=relaxed/simple;
	bh=V9ySPHFHra331Yt/URq8+X+I4ysMrTRGrhBFu5T7R4g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=lhz2BxwkYPtoiSvrNNIdcdyi//4eeGeBXI19l0ygVPxEXyyk4E4o5LhxcESwT7eVec70dmfcCNjZpoJuP2EQpj/9YqgTJgP0XjOOE8PQivd6/ugfkN/tlrk43D168D5SfpXspVcoDxuRCNc5gJrJJ+BR3Vsmmbz8JutzSfZ62/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NtfY6v6C; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712905893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V9ySPHFHra331Yt/URq8+X+I4ysMrTRGrhBFu5T7R4g=;
	b=NtfY6v6CSr779YYmjUMVkz1h47Bds4bL2MEksRAlvZhncEtGhPOvKOrkhvxC92qvuzAykD
	B3PyFLQYlOqjldkxpeD6rre2NfhIxW6/00T6+DvwQ6SNmDv6J/dqxxOcEXwHJKJg+wfjYS
	PhW78tutTntU89SdWv9ynkdl5ew1iwA=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-eT69EwHuMxqbKe5-jsHZmg-1; Fri, 12 Apr 2024 03:11:31 -0400
X-MC-Unique: eT69EwHuMxqbKe5-jsHZmg-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2a48f935627so572902a91.2
        for <linux-i2c@vger.kernel.org>; Fri, 12 Apr 2024 00:11:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712905891; x=1713510691;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V9ySPHFHra331Yt/URq8+X+I4ysMrTRGrhBFu5T7R4g=;
        b=R0xV1TqHIUPXe1eF2e1guQ5PFyjSQu9tJnYyf1+GwhzYLf6A4XVCGKz+W+dyMbI35e
         GaFTJ6D7tzySyUNG1hVbMgVnIwFbcIK4OTXGNBT5DbdMKhnNhzWoRv4nlY9LBTzhGIvJ
         7HyOsGTJ9gjtLUMRaJhhQvkCmEMrBk+wJhbaanwn2FkIs2enpar2puGpStaGUJ0X4KbZ
         z3WY5Hta2QzypSAn2lGfJ2KoEBP2MuGcMXK+FhbMVHtcFjkxxMoClupXRDUNI29S626b
         gJXwLVLZg4YzepmmCU1sIw74HVwxFNPdJ2U7M5mJB8KMFQPXlrsWtPQRIif2xaP75RWj
         OKaA==
X-Forwarded-Encrypted: i=1; AJvYcCV9GGUTW69nTceDkoKRab7Ygty9BilFoTC0NhFVpGBAlXtoP/2S2Ji4I7aUcK+b4Hm1zmZs3fAl/+/5sPvXWwN82GJCClZALcP1
X-Gm-Message-State: AOJu0YzAdXp3Em+ujRy2c2ghDbCEN1IqahXLLdCPYmL+6NNpbVbr5anY
	ZQcOambvGaVnQiyziULuQeJcKzQg0UMjHgj5QMjS1D0ctSdnIeV9iG5502NqNDOopCJ/N3K+u3/
	6rn3qzhZLd8eh8AQ7UvAaojEA1dF6dxPtmDuoa/xMTyibWOTbl1dMsImWXFQ2l9eXbRFGB+LuBC
	mYVTEqdBAwrz3RG5EofvRVqNvlBqRf8/gH
X-Received: by 2002:a17:90b:19d0:b0:2a2:2b53:892e with SMTP id nm16-20020a17090b19d000b002a22b53892emr1531769pjb.32.1712905890784;
        Fri, 12 Apr 2024 00:11:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhB8Fe6/Taq6ZeJsX79391aj4U5l0Wu4b9n+gMtxFfFf7avWd+jelzxqFd1vgXfo/L+4G6ZPyVKQslNCiOcoU=
X-Received: by 2002:a17:90b:19d0:b0:2a2:2b53:892e with SMTP id
 nm16-20020a17090b19d000b002a22b53892emr1531760pjb.32.1712905890476; Fri, 12
 Apr 2024 00:11:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240411050257.42943-1-lukas.bulwahn@redhat.com>
 <whpjtk2nmbft4dqndhealztzxh5du4uemqmmizguwvhmfa2htm@qcklwqf7j4d4> <xn4dyzwe4quhrpiqrvdikx4f46eucw25kmwfevcyt3s2mvggjl@enzbluravbt6>
In-Reply-To: <xn4dyzwe4quhrpiqrvdikx4f46eucw25kmwfevcyt3s2mvggjl@enzbluravbt6>
From: Lukas Bulwahn <lbulwahn@redhat.com>
Date: Fri, 12 Apr 2024 09:11:19 +0200
Message-ID: <CAOc5a3Mi1_oAOrA9t-2=0TVbs9Xr_HPBr_O+L7FgyAiRdf8sPg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: adjust file entry in ARM/LPC32XX SOC SUPPORT
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Lukas Bulwahn <lbulwahn@redhat.com>, Animesh Agarwal <animeshagarwal28@gmail.com>, 
	linux-i2c@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2024 at 8:45=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > > -F: Documentation/devicetree/bindings/i2c/i2c-pnx.txt
> > > +F: Documentation/devicetree/bindings/i2c/nxp,pnx-i2c.yaml
> >
> > Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> >
> > I guess this should go through the arm folks?
>
> Could be argued, but I guess it is easier if you take it (because the
> conversion patch also went through your tree). Just 2 cents...
>

... and I am creating my patches against some recent linux-next tag.
So, the commit could really only be in your tree and the arm folks
would not apply it because the referred commit is not in their tree
yet (until the next merge window closes and they reopen a new branch).
So, as Wolfram suggested: please take my patch in your tree on top of
the referred commit.

Lukas


