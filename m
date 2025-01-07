Return-Path: <linux-i2c+bounces-8945-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5AFA03EEB
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2025 13:16:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53DF7160BBF
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2025 12:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E76021EE03D;
	Tue,  7 Jan 2025 12:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YsQ8aYoR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9CE1E3DE8;
	Tue,  7 Jan 2025 12:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736252186; cv=none; b=Jmz/iRLHDER6dBtzhBERVjOvkq0FwBB0z9wbNNcPUF9LS37LjZDdykxqp1oLIIRgfDmaIUNWBUmQfXO523/KMa5s0eyuTuPeWgV36Usqjgl6xagkxNBu0JcL9DZr3+8T9cyC7dBdGZ9AhqwdVlhzRrRAbz+Qy0vhUdg18NtsYyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736252186; c=relaxed/simple;
	bh=0htO8iAXNa+7LiEGqBinetMl0bwqhXQiCYieGc6PRGk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PAogfMZPqymBj8O4cg4rNPg1NBlAaTz/pFnc7lph9kDdkI84hAT389Mibq50OfCkVVK/RKQEtwNCvLwJw67+wtP9TQeeJ0IYh83QV6hejgZd78Lbon7IKpb/BpOsEX6jW2rXX2t5ugIkxJsoOjqKQAv8YpnOy6Io0Vx52FBQ1io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YsQ8aYoR; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ee46851b5eso18366288a91.1;
        Tue, 07 Jan 2025 04:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736252180; x=1736856980; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UxOnADQvKFurnA3oN6CrUdXTRTjn25a77hIa/cif9Mo=;
        b=YsQ8aYoRYIBxlrQZcqtvEL4gNN+l4DTnPyd4+5iCp0DM7Y8WXM6oM8mNq7QG4wKuiJ
         5DWcOWA2gmEbeCFM7fOFmgVtkOL92oCa884URH5hQHwdYiNdPujWFjY35NdRWvWQ2c5Q
         7yt3JFSKr7IRDjv0mOnSobahqvozlnS1ACeg6F7LIAwlP+8iiFhIIeGsh+3b8yoQPTSV
         D2edF/VWHMq8zHdxasDlB8TEgQDmFZhcgw+sEIuDb7Ynu3/4JIgLd0rAX60Q5bnESW25
         TGLFt4G3ZPnqgTFPCAkNefJgc/XNqzdPvlIJ7CxxTT1F5Jddn3VS7w0CTZ9T07h1KBaB
         9ODw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736252180; x=1736856980;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UxOnADQvKFurnA3oN6CrUdXTRTjn25a77hIa/cif9Mo=;
        b=Lp1Fv3v9ITxhbqbNZXt2DHGoeFdhiEiYD4JiNSDGaoeOjpE/sbXMSZboCKrABu8PN4
         UwSQH3xpgQxh68gjkSY6OxJGuW+g0BLwNhBXDOdXFI7b6wfo5zUZh+VV3Ig9BYwq/NSk
         84nQS29zVlfMB4+4QVGj9zZn4jmpCRbJKi6rQu+TSxCGtG7pDEApeCtxNAqlyNFiJOrT
         KrtF+kDqrk5D7y/gxxGdJCnMdWgvXP8Pmmf9jrbdoUGr6UK1RHrS0VvNUVjsoleS6zj0
         noBEQGE7EkEZIkb/MbreyN9E1wZgakIbRX6pzj3Vk6j7EqZNMUdWkPEj1kbgKgI8VY2R
         dTpg==
X-Forwarded-Encrypted: i=1; AJvYcCUY5R5D4qOxovEvjTtyV4cEd9uYD5di9WlQYT3GDmvn776IaDAFeq6tMUUBYbI3mmJh3qCbTfxVIylT@vger.kernel.org, AJvYcCWE1dZ9MPp8se6aarLru1cZIZm4/4YZUkuuuT/clIkbC1LdEKEVgCcWCihS/8wt3Gt9aYdXU4r7tR7X@vger.kernel.org
X-Gm-Message-State: AOJu0YwhTsPDxrKktH8tgKYzeuQKBMgxmqBQGg04e1PD5ejE0TuYMdjJ
	shGvuH8OcGLT2SwdVf2Eu/moDHWtnlHhm2Nqj3eTTxbhQPqpL5jth9vxFLE77N70KthbHUoJCng
	YfNZ0ylsgRtd7jwngc8x2q0tISnM=
X-Gm-Gg: ASbGncsWnmb7lDXDoVgD00tcNuor+Pd28l6NrvgjzMxdjXKNydUxw5gZ2k6gmYg9fzI
	VjkCvixFL/WDcg38CaCVPV+R6sjyq88O+eXIQGQ==
X-Google-Smtp-Source: AGHT+IH38lVtX9mPDTqMGfJZpybrAJsRRC1pfNmAiW9dVEZdkJaTdLjBLWHy83naBpFy0HutmNS6b1/87Z0+Z3aa/Pg=
X-Received: by 2002:a17:90b:2c8c:b0:2ea:3f34:f190 with SMTP id
 98e67ed59e1d1-2f452ec6fd2mr85510822a91.25.1736252180355; Tue, 07 Jan 2025
 04:16:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250103051657.211966-1-rha051117@gmail.com> <20250103051657.211966-2-rha051117@gmail.com>
 <20250103093353.GP3713119@black.fi.intel.com> <CACHtJB-rZ6SKF3d3xTsbJ=zQ+fPVcCcYxXLX_yMRdpE_4tyYYw@mail.gmail.com>
 <20250105083358.GU3713119@black.fi.intel.com> <CACHtJB94K5OLdHgs8dDj4jDBtZmsdymovboCcJJUt5OkD8o+Mg@mail.gmail.com>
 <20250107072746.GW3713119@black.fi.intel.com>
In-Reply-To: <20250107072746.GW3713119@black.fi.intel.com>
From: R Ha <rha051117@gmail.com>
Date: Tue, 7 Jan 2025 06:16:09 -0600
X-Gm-Features: AbW1kvZlxMJF99i_xPzbmhV__ZMrNkYAO7RzFJexwuNf4Gw_4HvhtbXRAufYdJ4
Message-ID: <CACHtJB-4UGaqKw5zZjE_vPeYX+bMUMiHPNfNYzD6Wmv6jdAuhg@mail.gmail.com>
Subject: Re: [PATCH 1/1] Force ELAN06FA touchpad I2C bus freq to 100KHz
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: wsa+renesas@sang-engineering.com, linux-i2c@vger.kernel.org, 
	linux-acpi@vger.kernel.org, trivial@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

Thanks for clarifying the speed. Seems like this bug is different than
I thought.

In my ACPI table there were no references to HCNT or LCNT
specifically. I'm not sure if this is normal.

In addition, I noticed that there were debug messages in dmesg
relating to the HCNT and LCNT.
I'm not sure if they'll be useful, but here they are (taken from an
unmodified kernel):
[    3.543648] i2c i2c-14: Successfully instantiated SPD at 0x50
[    3.543790] Standard Mode HCNT:LCNT = 552:652
[    3.543794] Fast Mode HCNT:LCNT = 100:200

Here's what I have found with the string "\\_SB.PC00.I2C1" in my ACPI table:
#1
Scope (_SB)
{
    Device (PEPD)
    {
        Name (_HID, "INT33A1" /* Intel Power Engine */)  // _HID: Hardware ID
        Name (_CID, EisaId ("PNP0D80") /* Windows-compatible System
Power Management Controller */)  // _CID: Compatible ID
        Name (_UID, One)  // _UID: Unique ID
        Name (LBUF, Buffer (0xC0){})
        Name (PPD0, Package (0x03)
        {
            "\\_SB.PC00.SAT0",
            Zero,
            Package (0x02)
            {
                Zero,
                Package (0x03)
                {
                    0xFF,
                    Zero,
                    0x81
                }
            }
        })
        Name (PPD3, Package (0x03)
        {
            "\\_SB.PC00.SAT0",
            Zero,
            Package (0x02)
            {
                Zero,
                Package (0x02)
                {
                    0xFF,
                    0x03
                }
            }
        })
        Name (WWD3, Package (0x03)
        {
            "\\_SB.PC00.RP04",
            Zero,
            Package (0x02)
            {
                Zero,
                Package (0x02)
                {
                    0xFF,
                    0x03
                }
            }
        })
        Name (PKD0, Package (0x02)
        {
            Zero,
            Package (0x03)
            {
                0xFF,
                Zero,
                0x81
            }
        })
        Name (PKD3, Package (0x02)
        {
            Zero,
            Package (0x02)
            {
                0xFF,
                0x03
            }
        })
        Name (DEVY, Package (0x77)
        {
            [...]
            Package (0x03)
            {
                "\\_SB.PC00.I2C0",
                One,
                Package (0x02)
                {
                    Zero,
                    Package (0x02)
                    {
                        0xFF,
                        0x03
                    }
                }
            },

            Package (0x03)
            {
                "\\_SB.PC00.I2C1",
                One,
                Package (0x02)
                {
                    Zero,
                    Package (0x02)
                    {
                        0xFF,
                        0x03
                    }
                }
            },

            Package (0x03)
            {
                "\\_SB.PC00.XHCI",
                One,
                Package (0x02)
                {
                    Zero,
                    Package (0x02)
                    {
                        0xFF,
                        0x03
                    }
                }
            },

            Package (0x03)
            {
                "\\_SB.PC00.HDAS",
                One,
                Package (0x02)
                {
                    Zero,
                    Package (0x03)
                    {
                        0xFF,
                        Zero,
                        0x81
                    }
                }
            },
            [...The rest are similar, only changinng the strings]
        })
    }
}

#2 (seems related to another device)
Scope (_SB.PC00.I2C1)
{
    Device (PA06)
    {
        Name (_HID, "MCHP1930")  // _HID: Hardware ID
        Name (_UID, "I2C1&PA06")  // _UID: Unique ID
        Name (_S0W, 0x03)  // _S0W: S0 Device Wake State
        Method (_STA, 0, Serialized)  // _STA: Status
        {
            If (POME)
            {
                Switch (ToInteger (PLID))
                {
                    Case (Package (0x01)
                        {
                            0x0C
                        }

)
                    {
                        Return (0x0F)
                    }
                    Default
                    {
                        Return (Zero)
                    }

                }
            }

            Return (Zero)
        }

        Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
        {
            Name (RBUF, ResourceTemplate ()
            {
                I2cSerialBusV2 (0x0000, ControllerInitiated, 0x00061A80,
                    AddressingMode7Bit, "\\_SB.PC00.I2C1",
                    0x00, ResourceConsumer, _Y3A, Exclusive,
                    )
            })
            CreateWordField (RBUF, \_SB.PC00.I2C1.PA06._CRS._Y3A._ADR,
BADR)  // _ADR: Address
            Switch (ToInteger (PLID))
            {
                Case (Package (0x01)
                    {
                        0x0C
                    }

)
                {
                    BADR = 0x17
                }
                Default
                {
                    BADR = Zero
                }

            }

            Return (RBUF) /* \_SB_.PC00.I2C1.PA06._CRS.RBUF */
        }

        Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
        {
            If ((Arg0 != ToUUID
("033771e0-1705-47b4-9535-d1bbe14d9a09") /* Unknown UUID */))
            {
                Return (Buffer (One)
                {
                     0x00                                             // .
                })
            }

            Switch (ToInteger (Arg2))
            {
                Case (Zero)
                {
                    Switch (ToInteger (Arg1))
                    {
                        Case (Zero)
                        {
                            Return (Buffer (One)
                            {
                                 0x03
           // .
                            })
                        }
                        Case (One)
                        {
                            Return (Buffer (One)
                            {
                                 0x7F
           // .
                            })
                        }

                    }

                    Break
                }
                Case (One)
                {
                    Name (PKG1, Package (0x02)
                    {
                        Package (0x08)
                        {
                            "",
                            Zero,
                            "",
                            Zero,
                            "",
                            Zero,
                            "",
                            Zero
                        },

                        Package (0x08)
                        {
                            "",
                            Zero,
                            "VBAT_IN_ELPMIC",
                            0x32,
                            "V3P3DX_EDP",
                            0x0A,
                            "VCC_EDP_BKLT",
                            0x32
                        }
                    })
                    Switch (ToInteger (PLID))
                    {
                        Case (Package (0x01)
                            {
                                0x0C
                            }

)
                        {
                            Return (DerefOf (PKG1 [One]))
                        }
                        Default
                        {
                            Return (DerefOf (PKG1 [Zero]))
                        }

                    }
                }
                Case (0x02)
                {
                    If ((Arg1 < One))
                    {
                        Break
                    }

                    Name (PKG2, Package (0x02)
                    {
                        Package (0x04)
                        {
                            Zero,
                            Zero,
                            Zero,
                            Zero
                        },

                        Package (0x04)
                        {
                            Zero,
                            0xC350,
                            0x2710,
                            0xC350
                        }
                    })
                    Switch (ToInteger (PLID))
                    {
                        Case (Package (0x01)
                            {
                                0x0C
                            }

)
                        {
                            Return (DerefOf (PKG2 [One]))
                        }
                        Default
                        {
                            Return (DerefOf (PKG2 [Zero]))
                        }

                    }
                }
                Case (0x03)
                {
                    If ((Arg1 < One))
                    {
                        Break
                    }

                    Name (BUF3, Package (0x01)
                    {
                        0x0F
                    })
                    Return (BUF3) /* \_SB_.PC00.I2C1.PA06._DSM.BUF3 */
                }
                Case (0x04)
                {
                    If ((Arg1 < One))
                    {
                        Break
                    }

                    Name (BUF4, Package (0x01)
                    {
                        Zero
                    })
                    Return (BUF4) /* \_SB_.PC00.I2C1.PA06._DSM.BUF4 */
                }
                Case (0x05)
                {
                    If ((Arg1 < One))
                    {
                        Break
                    }

                    Name (BUF5, Package (0x02)
                    {
                        0x0400,
                        0x08
                    })
                    Return (BUF5) /* \_SB_.PC00.I2C1.PA06._DSM.BUF5 */
                }
                Case (0x06)
                {
                    If ((Arg1 < One))
                    {
                        Break
                    }

                    Name (BUF6, Package (0x01)
                    {
                        0x0384
                    })
                    Return (BUF6) /* \_SB_.PC00.I2C1.PA06._DSM.BUF6 */
                }

            }

            Return (Buffer (One)
            {
                 0x00                                             // .
            })
        }
    }
}

#3 (also seems related to another device)
ElseIf ((I2SB == One))
{
    Scope (_SB.PC00.I2C1)
    {
        Device (HDAC)
        {
            Name (_HID, "INT00000")  // _HID: Hardware ID
            Name (_DDN, "Intel(R) Smart Sound Technology Audio Codec")
 // _DDN: DOS Device Name
            Name (_UID, One)  // _UID: Unique ID
            Name (CADR, Zero)
            Name (CDIS, Zero)
            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                If ((I2SC == One))
                {
                    _HID = "INT34C2"
                    _CID = "INT34C2"
                    CADR = 0x1C
                }
                ElseIf ((I2SC == 0x02))
                {
                    _HID = "10EC1308"
                    _CID = "10EC1308"
                    CADR = 0x10
                }
                ElseIf ((I2SC == 0x03))
                {
                    _HID = "ESSX8326"
                    _CID = "ESSX8326"
                    _DDN = "ESSX Codec Controller 8326 "
                }
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                If ((I2SC == 0x03))
                {
                    Name (SBFB, ResourceTemplate ()
                    {
                        I2cSerialBusV2 (0x0018, ControllerInitiated, 0x00061A80,
                            AddressingMode7Bit, "\\_SB.PC00.I2C0",
                            0x00, ResourceConsumer, , Exclusive,
                            )
                        I2cSerialBusV2 (0x0009, ControllerInitiated, 0x00061A80,
                            AddressingMode7Bit, "\\_SB.PC00.I2C0",
                            0x00, ResourceConsumer, , Exclusive,
                            )
                    })
                    Name (PBUF, ResourceTemplate ()
                    {
                        GpioIo (Exclusive, PullDefault, 0x0000,
0x0000, IoRestrictionOutputOnly,
                            "\\_SB.GPI0", 0x00, ResourceConsumer, ,
                            )
                            {   // Pin list
                                0x0000
                            }
                    })
                    Name (SBFG, ResourceTemplate ()
                    {
                        GpioInt (Edge, ActiveBoth, ExclusiveAndWake,
PullNone, 0x0000,
                            "\\_SB.GPI0", 0x00, ResourceConsumer, ,
                            )
                            {   // Pin list
                                0x0000
                            }
                    })
                    CreateWordField (PBUF, 0x17, PWRP)
                    PWRP = GNUM (0x09030006)
                    CreateWordField (SBFG, 0x17, INTP)
                    INTP = GNUM (0x09030007)
                    Return (ConcatenateResTemplate (SBFB,
ConcatenateResTemplate (PBUF, SBFG)))
                }
                Else
                {
                    Return (ConcatenateResTemplate (IICB (CADR, I2SB),
INTB (I2SI, Zero, Zero)))
                }
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (((I2SC != Zero) && (CDIS != One)))
                {
                    Return (0x0F)
                }

                If ((CDIS == One))
                {
                    Return (0x0D)
                }

                Return (Zero)
            }

            Method (_SRS, 1, Serialized)  // _SRS: Set Resource Settings
            {
                CDIS = Zero
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                CDIS = One
            }

            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg0 == Buffer (0x10)
                        {
                            /* 0000 */  0x04, 0x0C, 0x80, 0xA9, 0x16,
0xE0, 0x3E, 0x34,  // ......>4
                            /* 0008 */  0x41, 0xF4, 0x6B, 0xCC, 0xE7,
0x0F, 0x43, 0x32   // A.k...C2
                        }))
                {
                    If ((Arg2 == Zero))
                    {
                        Return (0x55)
                    }

                    [...Rest are similar to above, for values of Arg2
from 0 to DF]
                }

                Return (0xFF)
            }
        }
    }
}

