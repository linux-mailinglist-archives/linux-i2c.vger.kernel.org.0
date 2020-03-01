Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EE65174F10
	for <lists+linux-i2c@lfdr.de>; Sun,  1 Mar 2020 20:02:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726359AbgCATC6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 1 Mar 2020 14:02:58 -0500
Received: from mout.gmx.net ([212.227.17.22]:53029 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726146AbgCATC5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 1 Mar 2020 14:02:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1583089374;
        bh=b7klEXlb9iSc2WlfM7FNvMUOj01QhI9dl87GI1ydfjY=;
        h=X-UI-Sender-Class:From:To:CC:In-reply-to:Subject:Reply-to:
         References:Date;
        b=gAsXDbhmQbMD5FXUvEhMLGpWRCCNce4WM05utPSPYdy6xEzkujYN9AWZbg3Fcqhpf
         hhSbhUOAG9e0R817mT2kOZjobzl5w+E1BWyDDnBfklBUptAY2SqZcVIcTNQSJSHZAk
         2/p4ev0RRoAnh5LOaOQHGdpmf2XKQsS/Cr3nV4wY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from corona.crabdance.com ([173.228.106.117]) by mail.gmx.com
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MYeR1-1iwE2g3Pk3-00VgES; Sun, 01 Mar 2020 20:02:54 +0100
Received: by corona.crabdance.com (Postfix, from userid 1001)
        id BC7C96E85603; Sun,  1 Mar 2020 11:02:10 -0800 (PST)
From:   Stefan Schaeckeler <schaecsn@gmx.net>
To:     luto@kernel.org
CC:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
In-reply-to: <CALCETrXcFrR9V_yjPRh9eJ1=1efo_DCCwGTeusmo2CQXpFFdrw@mail.gmail.com>
        (message from Andy Lutomirski on Tue, 25 Feb 2020 13:49:34 -0800)
Subject: Re: [PATCH 0/1] i2c: imc: Add support for Intel iMC SMBus host controller.
Content-Type: text/plain
Reply-to: schaecsn@gmx.net
References: <1582498270-50674-1-git-send-email-schaecsn@gmx.net> <CALCETrXcFrR9V_yjPRh9eJ1=1efo_DCCwGTeusmo2CQXpFFdrw@mail.gmail.com>
Message-Id: <20200301190210.BC7C96E85603@corona.crabdance.com>
Date:   Sun,  1 Mar 2020 11:02:10 -0800 (PST)
X-Provags-ID: V03:K1:uvcoIrN+VcLwbyStKhfI0D1Cs3p4kQM6IPQ01WeRQUxu+l4kYc4
 DMqfdTUsUVfm8FvMDYr4k/cBxgFKlyssm8CL1N96mwcvDtlLKTQmo8Fxqba2uLz40q1bg9Z
 npe/kJS0Pdin/KXWxgXlyShnHAzbSCIYVvS9EfZgYLOwmBbeLPZiSXrBi9XQn8/mTcKf/7k
 UYqOnf2Tk9KwWc/hA/nFg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1DZx5GvmMoQ=:DtP0k+dC4IOLFn11IMVOre
 N6UqlaXcf2dsL6SX2F63jIs/qEFvIy04hIVtcgyB7+XbMfC3BvrkvSv8p5vq1/7/MlHkGllu5
 5JWHQbvarXhtoXTjopjrDSaiF4Ox7XFXZDYXft8vTByAJG5/aEuxjoYX7IbmrWK8kqda+l4KI
 G4o2Lb7g0uZ0TZB9TCiPPKi6UifFnj9B3YAORJFOuZ9hZM9sBc2dFUOYvhnXvr26xmHGB6kbe
 /o6lt73Hus65aenm8acGza2+odQqZ4R9bkq1VikbgiCZpPg0NK8ZeQ+d6whn4viS45hS8rPje
 d3a7hMwzpbiK3jfxZya5QnVnl0iXGtBWaeKLXcWrBdy59AoQTyIgrfTPymqJ296yGtbULpXGH
 85bSI9OHK25Ocz6SJKTa4RZnl3wAg8iwsW//YuYcaQ2MLbXG2YSbsw/zzYSnRpq7/ZlZrxMNk
 WURzJzbWkk3GxnLvuq9C+sHcCkkCqDf7qddKB2wPF+7XTdx3pDzKCSWI7NZB0JH9sXXpHxfDh
 SsILCge6BsjYuA2LFfR6NO+U+yJJ8UKhPwzmHW46MdQQawhZCUbMMmEfatXsumTYDLMtaX9Yx
 NFhvnRT+eHEw//IQhwwGJ8N8WLI0JAcVXgA6TfcLKEg7LRBYTBNdYDmiXk2JgjDMfgV/pooyO
 I6XBmpLSDYJNaNQUwL4ouXhoDPwrVx/yi/nUyitGCX2NcoleU/xao66LA77n0Mn3hGZhiYyCm
 OaB8JHH0UFX2E6aKF++R7uDw6sH5rG5MAJc5hDEBrkIJSn/6XJhmR5LWUtjpyEa9fW5VhQgYN
 KaWXkpGROOmSSnhfOokjeF2c1CWK8wy12b91wy0lAsSVR4XHQY5fiKmvuJnK4eegK2lsnuBGV
 jckbVQhlwQjg6h21bAXEC/00RBaplNaeSBuQxWX7ooskjYw1isyHPE11ZkxWXAUWRzQZaMgcA
 KX2V/1rVxEXzQTXl9UzL2bePNCXp1bLNp+Pvb2fb9cfbva6yjWYzo0/9e5rGzkGZba/dgLMYI
 gxOHBr0c6cdM83QIz5vbjcfcrv1pEuhLouq3d2qOMP5ZxyFzIiyG3PHJd30hZ+HQrCV25OiIJ
 bJS/22FO1O6kj5X3vF7aLzd2gy339E2Y+sxOyCCrJaFZj0PdV4MvurtyW6+XL7MXjVRl0zvvq
 x2xISo2I2ttI5ZWZwakn9WdfIq2sqmwJNgMQMSew8NawUi6PlvbBk8d/CuA8ic0cow2RKlz5a
 zPgZztPcLILEqkAJA
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Any,

> > This patch is based on Andy Lutomirski's iMC SMBus driver patch-set
> > https://lkml.org/lkml/2016/4/28/926. It never made it into the kernel.=
 I hope
> > this rewrite will:
> >
> >
> > Overview
> >
> > Modern Intel memory controllers host an SMBus controller and connectio=
n to
> > DIMMs and their thermal sensors. The memory controller firmware has th=
ree modes
> > of operation: Closed Loop Thermal Throttling (CLTT), Open Loop Thermal
> > Throttling (OLTT) and none.
> >
> > - CLTT: The memory controller firmware is periodically accessing the D=
IMM
> >   temperature sensor over the SMBus.
> >
>
>
> I think this is great!  One question, though: what happens if the
> system is in CLTT mode but you disable CLTT and claim the bus for too
> long?  For example, if there's an infinite loop or other lockup which
> you have the tsod polling interval set to 0?  Does the system catch
> fire or does the system do something intelligent like temporarily
> switching to open loop?

I don't know. Most likely, the current memory throttling rate will be kept=
.
That might not be enough for the forthcoming workload and, ehm, the system=
 may
catch fire.

I assume our use-case is the most common use-case for this driver: our emb=
edded
system comes with its own environmental management software. It monitors, =
among
other sensor values, the DIMM temperatures and takes action on abnormal va=
lues.
If one is concerned about your scenario, then the environmental management
software needs to consider blocked reads on the sysfs node as a worst case
scenario and reboot the system.

Nothing can really go wrong while the polling interval is set to 0, though=
:

- reading and setting pci configuration space registers.
- calling dev_err, dev_warn and alike.
- usleep_range(131,140) and up to 20 udelay(9).

What is not clear to me is what if imc_smbus_xfer() is executing while the
driver is rmmod-ed. Defensively, I set in the driver's remove function the
tsod_polling_interval back to its original value.

~ Stefan
