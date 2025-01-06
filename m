Return-Path: <linux-i2c+bounces-8922-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F40A0214F
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jan 2025 10:01:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D664188490C
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jan 2025 09:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF7381D89E9;
	Mon,  6 Jan 2025 09:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EOy2eJdi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D74B18E02D;
	Mon,  6 Jan 2025 09:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736154067; cv=none; b=MSl3IP2qizCEbSmeSWxVReMrLDsNYkSccYFot5mMrNk3NJRjV5+ckyjMf8J2RyeI0ABgtk5j1VBW5x2fiYjhSQ69SoYAJvPxu8XEd0fe2yns5q+aLExnccc6bsY/bMfzFXJqQgxGQVJHontLywk5X1HzDbtW4ncoShktkliO3qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736154067; c=relaxed/simple;
	bh=bkrGbIZSMlVQ7KRimDSafEmFHXnn9BDNe3gJiR8Gdu8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qJsTEUESzQBTsbpPGS0Iuve3LmNqtd2X3Vn2h6XUPdFeub3ROr2M7OPc7f8iTY/7LCs4eSKRzUR7g4CwS7iMJQ9m+wv+i8oIviVbyHoAXF71I6QBzCar8dof3ZFrxkDjk/yKUmxgAsoZOA69ofmQfeqaFMn+OESGMJ9a4U/u4s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EOy2eJdi; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ee8aa26415so20405717a91.1;
        Mon, 06 Jan 2025 01:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736154064; x=1736758864; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=weOnh+MzlfdluI1xSfKxbZzr5nwaYbJphyAVMsxXLEI=;
        b=EOy2eJdi1aVGsdwYHTKhscZIZS21TGsrvMnLwYBDoQQIMJZl6bckZJUe86tW6TzwHh
         Cfqh7lVTKJtPIsmR+eJQKySVWRM0owmOQpQS1XdEBf8L/qqWPsgMlpo27KU5V1a1LdSc
         LbEn94BsuK+qw9pdtBniCt9UksebnWYIChVlviVhqbciNVS52cRqDKS3Pov4V/wZ+eIL
         J337uY9wHXRl936F3nFfBolsCk5Eu5BkbELPCVH0yYzgM0cIxX0xxONLMP1R0koYLJNB
         f2Flu6866Y2tdDm/TpBskFYFzy9HS2Kca4VQ5P8hugrDRwdieb8J+x98kDxnQTcuPtTj
         Na4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736154064; x=1736758864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=weOnh+MzlfdluI1xSfKxbZzr5nwaYbJphyAVMsxXLEI=;
        b=A5j0O14sL4ffWyNx/bAR+w60QLtmIj/NFdIX/9ap5rKlvxf+wLyMwDHuK3hqWzFlxe
         NVqtAtP0qFmFzRO8UQ40R7qorWv36ehkhrcldJl/si/Ce7tBYZN+BzstVX9luvzsDVjN
         2Ku0lPCci+yheMIldi4UeqLJCjgIu8n9cRsJejQJ4hpyT+eM4hZcr3aMc95HgUefZ9z4
         TU1c6pFDMX4njz6pV4/BQkMP7XUR7X6UyJTJbO/DvZe2xc3JH81kNcAwDvlbw6O+GLYZ
         VpGSTZ3YZsoEg3AW3AvOO7lRsMV4KOGggi9exD+UzdiiwCkp3SKNIZnS2ccXsZpHISkn
         WHIg==
X-Forwarded-Encrypted: i=1; AJvYcCWgRCFT4gzt3rTwT/LIJ09jqaDSx8I5QkDEmP28LFi4qEOMN6FHGlJx5NrGXOLQTyyxmGV5BqRytyqG@vger.kernel.org, AJvYcCXDK90v121nIaSfL4E9ox+Xj8eD+FxLO+pnjDJrrhwNL6z8mtJvK35c2O3cfXpxv2Dw2TvRrR9clnL4@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7o8SMs3hJABD97iPT4XUDXkbf6+mhyA8AEDW/wSM9wxlnYTDd
	7Bjfevh99G0YuLEziC92L4FvTo5IC/o+F7pxaJ9rGARfva9l43YsTxaBi9jYa/buR9fouFD9+1X
	kxWii7MSHxEjkIGSC/vaJb7huPC+ZFfzbyy8=
X-Gm-Gg: ASbGnctmcdEq4YUd3jygygBNC/Ds/P5RyqtvPvFxm0yq+DBDIVfehNa8tfDIamDahG4
	2uuY02DWvGHDyqpNT8+PyOhqEMhh/TJKpjJfabg==
X-Google-Smtp-Source: AGHT+IHd3cDLvsz8AmF0+o101B7y8MKODhnOlatUm5hjDXr+GNC8vdd2htOTbfBORzg2Rc6hOgZBS0Hja/BAkW5MDfg=
X-Received: by 2002:a17:90b:544f:b0:2ee:d433:7c54 with SMTP id
 98e67ed59e1d1-2f452e372e2mr87440844a91.19.1736154064185; Mon, 06 Jan 2025
 01:01:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250103051657.211966-1-rha051117@gmail.com> <20250103051657.211966-2-rha051117@gmail.com>
 <20250103093353.GP3713119@black.fi.intel.com> <CACHtJB-rZ6SKF3d3xTsbJ=zQ+fPVcCcYxXLX_yMRdpE_4tyYYw@mail.gmail.com>
 <20250105083358.GU3713119@black.fi.intel.com>
In-Reply-To: <20250105083358.GU3713119@black.fi.intel.com>
From: R Ha <rha051117@gmail.com>
Date: Mon, 6 Jan 2025 03:00:53 -0600
X-Gm-Features: AbW1kvbwZydtd-XPsYEnVAphmpPO-3R-q6aK2-RYvZ8YcLBpKsr0ow055ug8mFo
Message-ID: <CACHtJB94K5OLdHgs8dDj4jDBtZmsdymovboCcJJUt5OkD8o+Mg@mail.gmail.com>
Subject: Re: [PATCH 1/1] Force ELAN06FA touchpad I2C bus freq to 100KHz
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: wsa+renesas@sang-engineering.com, linux-i2c@vger.kernel.org, 
	linux-acpi@vger.kernel.org, trivial@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 5, 2025 at 2:34=E2=80=AFAM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> In general it is good to follow the existing changelogs but in this case =
I
> would prefer to add the details of the system in question (so we know wha=
t
> systems the quirk is applied to).

Alright, I sent an updated patch with a commit message that specifies
the devices affected.

On Sun, Jan 5, 2025 at 2:34=E2=80=AFAM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> Okay thanks for sharing. I don't see the "SPED" beeing assigned in the
> below snipped though.

I believe "SPED" is left unassigned. There are two reasons for this.
1. I could not find a place where it was assigned in the ACPI table
(in the snippet, every line with the word "SPED" was already
included).
2. In the file drivers/i2c/busses/i2c-designware-common.c, the code in
the function "i2c_dw_adjust_bus_speed" falls through to the "else"
case.

For (2), here is the relevant function where the control flow falls to
the "else" case. I found this by adding a print-debugging statement
after the last "else" statement.
static void i2c_dw_adjust_bus_speed(struct dw_i2c_dev *dev)
{
    u32 acpi_speed =3D i2c_dw_acpi_round_bus_speed(dev->dev);
    struct i2c_timings *t =3D &dev->timings;

    /*
     * Find bus speed from the "clock-frequency" device property, ACPI
     * or by using fast mode if neither is set.
     */
    if (acpi_speed && t->bus_freq_hz)
        t->bus_freq_hz =3D min(t->bus_freq_hz, acpi_speed);
    else if (acpi_speed || t->bus_freq_hz)
        t->bus_freq_hz =3D max(t->bus_freq_hz, acpi_speed);
    else
        t->bus_freq_hz =3D I2C_MAX_FAST_MODE_FREQ;
}

Actually, after some further investigation, I found that I missed a
few lines in my previous snippet. Specifically the line concerning the
method "I2CSerialBusV2".
Here is the full snippet pasted below since I don't want to miss
anything else, I'm sorry for the length but want to make sure
everything is included.
Scope (_SB.PC00.I2C1)
{
    Name (I2CN, Zero)
    Name (I2CX, Zero)
    Name (I2CI, One)
    Method (_INI, 0, NotSerialized)  // _INI: Initialize
    {
        I2CN =3D SDS1 /* \SDS1 */
        I2CX =3D One
    }

    Device (TPD0)
    {
        Name (HID2, Zero)
        Name (SBFB, ResourceTemplate ()
        {
            I2cSerialBusV2 (0x002C, ControllerInitiated, 0x00061A80,
                AddressingMode7Bit, "\\_SB.PC00.I2C1",
                0x00, ResourceConsumer, _Y53, Exclusive,
                )
        })
        Name (SBFG, ResourceTemplate ()
        {
            GpioInt (Level, ActiveLow, ExclusiveAndWake, PullDefault, 0x000=
0,
                "\\_SB.GPI0", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x0000
                }
        })
        Name (SBFI, ResourceTemplate ()
        {
            Interrupt (ResourceConsumer, Level, ActiveLow,
ExclusiveAndWake, ,, _Y54)
            {
                0x00000000,
            }
        })
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

            If ((TPTY =3D=3D 0x02))
            {
                _HID =3D "SYNA2BA6"
                _SUB =3D "SYNA0001"
                BADR =3D 0x2C
                HID2 =3D 0x20
                Return (Zero)
            }

            If ((TPTY =3D=3D 0x04))
            {
                _HID =3D "CRQ1080"
                _SUB =3D "CRQ0001"
                BADR =3D 0x2C
                HID2 =3D 0x20
                Return (Zero)
            }

            If ((TPTY =3D=3D 0x05))
            {
                _HID =3D "FTCS0038"
                _SUB =3D "FTCS0001"
                BADR =3D 0x38
                HID2 =3D One
                Return (Zero)
            }
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

        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If ((TPTY =3D=3D Zero))
            {
                Return (Zero)
            }
            Else
            {
                Return (0x0F)
            }
        }

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

        Method (TPRD, 0, Serialized)
        {
            Return (^^^LPCB.EC0.ECTP) /* \_SB_.PC00.LPCB.EC0_.ECTP */
        }

        Method (TPWR, 1, Serialized)
        {
            ^^^LPCB.EC0.ECTP =3D Arg0
        }
    }
}

