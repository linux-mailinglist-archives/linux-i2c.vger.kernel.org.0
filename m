Return-Path: <linux-i2c+bounces-8909-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E124A01118
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Jan 2025 00:46:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9C6C7A1D77
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 23:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 884B91C3316;
	Fri,  3 Jan 2025 23:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TSpMItao"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C857C1C330D;
	Fri,  3 Jan 2025 23:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735948000; cv=none; b=Q/HIewPiJpU5CrxYcFa+XoPZVqfafHB+WwMbwSkyfKF2IaXyzFyRqNTCq6H0QYhWxM++IrNKMyo3aLFH+qd+T6tSvJe8wRut7Dc3czQCdLzBKfdWNdOzPOdfHW5hb7ZYP5dLd9Am1SZtbtSlqrDFmRqhl+WUUvNsWIixfVorbIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735948000; c=relaxed/simple;
	bh=+kOFSTt1yN8C1HgklZWAujvYQ3HjOObE0C+E8KQnGb4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kcbuxa31dLWrYz1OTXAnI6pxmjVCAS1yb7y9cvYtmeAQhLL7EzJhmS8Ew2it8YSObllHjeUv/GNrqKAdSxfBYYHk0I7KuVGwF8nE/tKuWmIxIostgSXxU5vTtZhQi9YDF0phaMlJ5woeje+2Kx+aIxbO+UlGI4DeP8pG/PFm1dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TSpMItao; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-215770613dbso131944695ad.2;
        Fri, 03 Jan 2025 15:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735947998; x=1736552798; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=unpA7tQxhkzAIxg8ypn6vEp+bXYUhhoNAs0/O6Yuzu8=;
        b=TSpMItaoOABOS4dYzAL3CwXwLrWbyTCWFbhWaJaDgoJ/b1RA6IhiNJUcLO26k2U1Ow
         R9WbdnjUOWVW16jZeOjkisMrSkFeoRn6c73MnKGAYrnBbDUXC5RHXmo+dx3SQyqjshMj
         6xxfYlDC9AtnEY1ITAtZuysJsxOXw/wk0Cs8cgLm1HS/Y5QPx1fGFhf2sMs8KAQWfIss
         i4jyheQcwSqwFT4GVxI+dr4dH5aES9I28uyLJOLqr15qCWzpAh0spse6eTcYZR56wGUV
         MgvbA1dKeLXFVeYYiMKCoceTeFwMZ+suhY4mcP6rV9Bx85xyqVCNtKh5O+o8RrKapuj5
         PxHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735947998; x=1736552798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=unpA7tQxhkzAIxg8ypn6vEp+bXYUhhoNAs0/O6Yuzu8=;
        b=bS12uCHW/GETisszIFf5qYZolCCOEoDpgbAo2llTX/i9CUf42oBV09yXn1dNs6Ko4a
         1zmto98CfXScibcWEzy08uergfNWgnujkH24Lj1jMikZ7sMdohv66/k99vex8xPe7tLw
         UX65cIZuKYmITBWf9YS+RG6ddWaq0C5ZlCITl+C6BnMh+imu9pGzyCyOKoDUV2BKYWLL
         uGCqqcCp/q9z4bXA2Ck65ZMxfQwUKRy+iVPGIDE3jLkuujTLiro1gWDldwBHoHil90R7
         VqQh6PyqeVnrevOEbKQDGtnBcOi3KxfXLIqYuJq3acGPAtM9MakM42/wROG3ywib7rz8
         qYdA==
X-Forwarded-Encrypted: i=1; AJvYcCUmzYPh62HQvLflWCWhC1ZAsyH/tliEDxqBVFP6BAOM7dMSPPQn1UWqRpoj6c9XQn8Nsc7kWmJ6E8gU@vger.kernel.org, AJvYcCV1vcz+koQuL9BqsbfpcAwqgCMKonFJqydsp4LkmTsNgN84Ch5DL67BZ121f7B6RbAtq+rqPAlANi+z@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8WfbNFPPfWus+3WCyKS3EwL2c8Ps8NgzJOfxZpVQDwfRrkGQc
	f8mYEBTYtqCFNdnUVUblumtuW8aoQL2dzhga/Ho1FA3bcOepXI5NeiFCOND4enh1eQ6omXN6VkC
	d4PbReYrLexe8tskaYaY5Z4jP9E5KMnuV024=
X-Gm-Gg: ASbGncu6kqh+uObpkg+9V30sex+4EAQ40GoZh3KY2dsAcGZm/IY73bxWpkwnFpX+yxO
	29En+V4bmKLUKjpHQNPe21LLnWYJox1o9ssgsNw==
X-Google-Smtp-Source: AGHT+IGPEUxJRAjHm+OUVK9TPOtQ9JZ+zbjuSrl9LulXqGOwiP1I3BNybRrvhvxY7KFZFHxcvqOnIsIoL5hnElDYRHQ=
X-Received: by 2002:a17:902:db06:b0:216:2bd7:1c49 with SMTP id
 d9443c01a7336-219e6ebacdamr736392985ad.29.1735947998060; Fri, 03 Jan 2025
 15:46:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250103051657.211966-1-rha051117@gmail.com> <20250103051657.211966-2-rha051117@gmail.com>
 <20250103093353.GP3713119@black.fi.intel.com>
In-Reply-To: <20250103093353.GP3713119@black.fi.intel.com>
From: R Ha <rha051117@gmail.com>
Date: Fri, 3 Jan 2025 17:46:27 -0600
X-Gm-Features: AbW1kvbfs1lzAiCJ4uPJ0hnsfEJc0scGac-lOQkXBToBwShhlER-6QLubAgsPdo
Message-ID: <CACHtJB-rZ6SKF3d3xTsbJ=zQ+fPVcCcYxXLX_yMRdpE_4tyYYw@mail.gmail.com>
Subject: Re: [PATCH 1/1] Force ELAN06FA touchpad I2C bus freq to 100KHz
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: wsa+renesas@sang-engineering.com, linux-i2c@vger.kernel.org, 
	linux-acpi@vger.kernel.org, trivial@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Thanks for reading my patch!

On Fri, Jan 3, 2025 at 3:33=E2=80=AFAM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> What are those "some devices" and "some controllers"?

The "Some Devices" are the Lenovo V15 G4 IRU, which I use, and
potentially the Lenovo V15 G4 AMN and Lenovo Ideapad Slim 3 15IAH8 as
well (based on issue reports from other users [1]).
The "Some Controllers" are the Designware I2C controller.

Sorry for not putting this in the commit message; I had tried to
follow the comments for the quirk I copied in Commit 7574c0db2e68c
("i2c: acpi: Force bus speed to 400KHz if a Silead touchscreen is
present"), which left them out.

On Fri, Jan 3, 2025 at 3:33=E2=80=AFAM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> Can you add the ACPI table snippet here too for reference?

I believe this is the correct snippet in my ACPI table (Again, V15 G4
IRU). Tried to edit it down as much as I could, hopefully this tells
everything. Please let me know how I should attach a longer snippet or
the full ACPI table if needed.
Scope (_SB.PC00.I2C1)
{
    [...]
    Device (TPD0)
    {
        [...]
        CreateWordField (SBFB, \_SB.PC00.I2C1.TPD0._Y53._ADR, BADR)
// _ADR: Address
        CreateDWordField (SBFB, \_SB.PC00.I2C1.TPD0._Y53._SPE, SPED)
// _SPE: Speed
        CreateWordField (SBFG, 0x17, INT1)
        CreateDWordField (SBFI, \_SB.PC00.I2C1.TPD0._Y54._INT, INT2)
// _INT: Interrupts
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            If ((OSYS < 0x07DC))
            {
                SRXO (0x09080011, One)
            }

            INT1 =3D GNUM (0x09080011)
            INT2 =3D INUM (0x09080011)
            If ((TPTY =3D=3D One))
            {
                _HID =3D "ELAN06FA"
                _SUB =3D "ELAN0001"
                BADR =3D 0x15
                HID2 =3D One
                Return (Zero)
            }
            [...]
        }

        Name (_HID, "XXXX0000")  // _HID: Hardware ID
        Name (_CID, "PNP0C50" /* HID Protocol Device (I2C bus) */)  //
_CID: Compatible ID
        Name (_SUB, "XXXX0000")  // _SUB: Subsystem ID
        Name (_S0W, 0x03)  // _S0W: S0 Device Wake State
        Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
        {
            If ((Arg0 =3D=3D HIDG))
            {
                Return (HIDD (Arg0, Arg1, Arg2, Arg3, HID2))
            }

            If ((Arg0 =3D=3D TP7G))
            {
                Return (TP7D (Arg0, Arg1, Arg2, Arg3, SBFB, SBFG))
            }

            Return (Buffer (One)
            {
                 0x00                                             // .
            })
        }
        [...]
        Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
        {
            If ((OSYS < 0x07DC))
            {
                Return (SBFI) /* \_SB_.PC00.I2C1.TPD0.SBFI */
            }

            If ((TPDM =3D=3D Zero))
            {
                Return (ConcatenateResTemplate (I2CM (I2CX, BADR, SPED), SB=
FG))
            }

            Return (ConcatenateResTemplate (I2CM (I2CX, BADR, SPED), SBFI))
        }
        [...]
    }
}

For comparison, the properties for a device that I think did set a
proper speed was like this:
If ((TPNP =3D=3D 0xD64D))
{
    _HID =3D "GTCH7503"
    HID2 =3D One
    BADR =3D 0x10
    SPED =3D 0x000F4240
    Return (Zero)
}

[1]: https://bbs.archlinux.org/viewtopic.php?id=3D297092

