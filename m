Return-Path: <linux-i2c+bounces-8960-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29521A056E3
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jan 2025 10:29:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2DA71886C74
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jan 2025 09:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 813DE1F130D;
	Wed,  8 Jan 2025 09:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nCDfj3Dy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E761E181B8F;
	Wed,  8 Jan 2025 09:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736328587; cv=none; b=TiqibOVEocxwb3fzT57jJbJBvXGa4Al+J2Q+nJqUFBcMCgQtzr3sQMauGYHLa3dGqsLz8GCewbnKXU8XuNyzsM5DDsFH9Ue93XLISqfSO+Hz8LaXQURjfFPuPmvCYrn8ShOc2IH88JWPpNOMyf1UgzYUfb+i8ELgmHZA+eVIZwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736328587; c=relaxed/simple;
	bh=lbLgja7iFrxALEZWuG3Cn8M2bIoxMClSO0bPUsYntks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JbeYsP2jLphuipaz5H+DZPw8ufYZqG36m/8RaYE3Lqz5ay/1HUSHFO2hYCXgZoro+KoUYcwSVVbb9B+MYNxuiOvuTY3IXUmVdX3VzcdSFBGUMVGCh9sZ8mXlVzTwmN5dFCSP0p2Emb47kwTi9lgMFVCz9QSHfT6G/E93wl8wEe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nCDfj3Dy; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ee50ffcf14so1002115a91.0;
        Wed, 08 Jan 2025 01:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736328585; x=1736933385; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Co1MX43J1KLoMimh8ejh62AJZqz0f32R+OMN2vhkJHg=;
        b=nCDfj3DyKVDm3OTvprMehMoitckprKwGzWkErVNQIcSoCymPjQnu7LKTo+5lNkb4BD
         TkL+Ww/iwQiemEllM7NBztkb+VMhK4BZGYLAHzV4Y7RuLwuzQk7JiKLT1HDni1k9QA9u
         yRQ794zo9KZh6lhwZUVXMO64NMfUuviw9YUjiGRAjLil9+OUMhcm6UG1u47kcrBIHfN1
         J1LYu4O43K+E5zSlqXtYIGNcSHFscMbzzHxm0xJBwxECXb/HEhzAm7XdLzGaChDqqXs6
         nSkvrGajKT8w8R5E1cxZcErUwtGs9OrbscmH4CoXBDA2yIve9lB1gJy0IQ/gmDeT4zEn
         7vIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736328585; x=1736933385;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Co1MX43J1KLoMimh8ejh62AJZqz0f32R+OMN2vhkJHg=;
        b=WrTB1ROaGa77SpxGoJ9hwTUhealfrFj9iMz7rB0BuQPPiPu2nJAaIiz3lqaMozhq8Q
         5jH9F+ehBNkQpbVRLA702GouHNYD5tDKNmE5bjFiM8Js6Z0yBODnYFHGABDH7kMOfMAA
         khe67tEZzZcCmCP/bnOK1D/OSEDDrW/NjFbVXiaCfm8O5x1zB5Nwp4og4ty5ePA+l8P6
         6OfDpclmpwGSe7CtzxDXuLqryyidqiz+XcxRgR+k626BBMW6gLkvlZAHfa5eRD/MNVmK
         hz1/xvIn2CbIZhPlo7JexW6u73CF111VpU98bNBeZ0Huz5kR1TD+lyqmV4xwHYBZgBEA
         N7vQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2dEY0oNjQmwP6vl4+5kOfGvhy1LkTpLwz3o3wUUv1if9Wno8Xcz+ndNbWrRpoIFssRbn7jydEPg+5@vger.kernel.org, AJvYcCWfkJ0DrOgi0bT3S+X9E56PVg6isutOzOFrdwZMNpoKVah19mdpAoFTkMD0ira05AIIjFy021GmwJQZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc0VkhezRd7Lml8sH2grh3F9/ZACKfc58s09KJcIkc0bNLICpT
	YuEeOP262y1L9rXzUx9fSepVbXyslheQzw9CUEtKFg+OPGaNxmSP9NryPwjWDhK4AqfrLnPuPsT
	JSRHO19/9eoBHLDOZWEeLKjyvlar2G/MTtCA=
X-Gm-Gg: ASbGncvMjjZSBSPgPoR2NTzxVccmwQhB9wZgC82F6EZYSOu19os9+khCHZl0t4LL1hy
	m9UNxKzQMmJ+1xfVswQCV+Pf/yX8yHlfMzdj30g==
X-Google-Smtp-Source: AGHT+IGOsozX6DJwAwVyC37JOhFkTNhXkVC+9kdxtG1TOepF01FW0KXYOfnYCnglUlPx0X3/qvyNfAC/Z6EgYAaBu1E=
X-Received: by 2002:a17:90b:2e4b:b0:2ee:463d:8e8d with SMTP id
 98e67ed59e1d1-2f53cc6e272mr9951514a91.14.1736328585083; Wed, 08 Jan 2025
 01:29:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250103051657.211966-1-rha051117@gmail.com> <20250103051657.211966-2-rha051117@gmail.com>
 <20250103093353.GP3713119@black.fi.intel.com> <CACHtJB-rZ6SKF3d3xTsbJ=zQ+fPVcCcYxXLX_yMRdpE_4tyYYw@mail.gmail.com>
 <20250105083358.GU3713119@black.fi.intel.com> <CACHtJB94K5OLdHgs8dDj4jDBtZmsdymovboCcJJUt5OkD8o+Mg@mail.gmail.com>
 <20250107072746.GW3713119@black.fi.intel.com> <CACHtJB-4UGaqKw5zZjE_vPeYX+bMUMiHPNfNYzD6Wmv6jdAuhg@mail.gmail.com>
 <20250108055150.GY3713119@black.fi.intel.com>
In-Reply-To: <20250108055150.GY3713119@black.fi.intel.com>
From: R Ha <rha051117@gmail.com>
Date: Wed, 8 Jan 2025 03:29:34 -0600
X-Gm-Features: AbW1kvYaR7Cp_6kGvrDtcqtahfgcmOSppgfOSNFfbMggKzkx0EVI0F4tSyPEBo4
Message-ID: <CACHtJB-33Pgoj0xORt75G0=cyoKem_K=Dfeg0iQNow18v2sV6Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] Force ELAN06FA touchpad I2C bus freq to 100KHz
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>, wsa+renesas@sang-engineering.com, 
	linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org, trivial@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Jan 7, 2025 at 11:51=E2=80=AFPM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> There should be Device() node for that too. The ones you listed are just
> child devices connected to that bus.

You're right, after searching for Device nodes I was able to find this
snippet. But it doesn't seem to have anything related to HCNT/LCNT
values either, but maybe they're hidden somewhere.
Thanks for the tip again.

Scope (_SB.PC00)
{
    Scope (\_SB.PC00)
    {
        Method (SOD3, 3, Serialized)
        {
            OperationRegion (ICB1, SystemMemory, (GPCB () + Arg0), 0x88)
            If (Arg1)
            {
                Field (ICB1, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x84),
                    PMEC,   8
                }

                PMEC =3D 0x03
                PMEC |=3D Zero
            }

            If ((Arg1 && Arg2))
            {
                Field (ICB1, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x10),
                    BAR0,   64
                }

                BAR0 =3D Zero
            }
        }
    }

    Method (I2CH, 1, Serialized)
    {
        OperationRegion (ICB1, SystemMemory, Arg0, 0x20)
        Field (ICB1, AnyAcc, NoLock, Preserve)
        {
            Offset (0x10),
            BAR0,   64,
            BAR1,   64
        }

        Name (BUF0, ResourceTemplate ()
        {
            Memory32Fixed (ReadWrite,
                0x00000000,         // Address Base
                0x00001000,         // Address Length
                _Y2B)
        })
        Name (BUF1, ResourceTemplate ()
        {
            Memory32Fixed (ReadWrite,
                0x00000000,         // Address Base
                0x00001000,         // Address Length
                _Y2C)
        })
        CreateDWordField (BUF0, \_SB.PC00.I2CH._Y2B._BAS, ADR0)  //
_BAS: Base Address
        CreateDWordField (BUF1, \_SB.PC00.I2CH._Y2C._BAS, ADR1)  //
_BAS: Base Address
        ADR0 =3D (BAR0 & 0xFFFFFFFFFFFFF000)
        ADR1 =3D (BAR1 & 0xFFFFFFFFFFFFF000)
        ConcatenateResTemplate (BUF0, BUF1, Local0)
        Return (Local0)
    }

    Device (I2C0)
    {
        If ((IM00 =3D=3D 0x02))
        {
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Sett=
ings
            {
                Return (I2CH (IC00))
            }

            Name (_STA, 0x08)  // _STA: Status
        }

        If ((IM00 =3D=3D One))
        {
            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                If (PCIC (Arg0))
                {
                    Return (PCID (Arg0, Arg1, Arg2, Arg3))
                }

                Return (Buffer (One)
                {
                     0x00                                             // .
                })
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                SOD3 (IC00, One, One)
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
            }
        }

        If (((IM00 =3D=3D One) || (IM00 =3D=3D Zero)))
        {
            Method (_ADR, 0, NotSerialized)  // _ADR: Address
            {
                Return (0x00150000)
            }
        }
    }

    [...I2C1-7 nodes removed]

    Method (SPIH, 1, Serialized)
    {
        OperationRegion (ICB1, SystemMemory, Arg0, 0x20)
        Field (ICB1, AnyAcc, NoLock, Preserve)
        {
            Offset (0x10),
            BAR0,   64,
            BAR1,   64
        }

        Name (BUF0, ResourceTemplate ()
        {
            Memory32Fixed (ReadWrite,
                0x00000000,         // Address Base
                0x00001000,         // Address Length
                _Y2D)
        })
        Name (BUF1, ResourceTemplate ()
        {
            Memory32Fixed (ReadWrite,
                0x00000000,         // Address Base
                0x00001000,         // Address Length
                _Y2E)
        })
        CreateDWordField (BUF0, \_SB.PC00.SPIH._Y2D._BAS, ADR0)  //
_BAS: Base Address
        CreateDWordField (BUF1, \_SB.PC00.SPIH._Y2E._BAS, ADR1)  //
_BAS: Base Address
        ADR0 =3D (BAR0 & 0xFFFFFFFFFFFFF000)
        ADR1 =3D (BAR1 & 0xFFFFFFFFFFFFF000)
        ConcatenateResTemplate (BUF0, BUF1, Local0)
        Return (Local0)
    }

    [...SPI nodes removed]
}

