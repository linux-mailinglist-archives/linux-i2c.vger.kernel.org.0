Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4B7540DD45
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Sep 2021 16:52:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238894AbhIPOxx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Sep 2021 10:53:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230429AbhIPOxx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Sep 2021 10:53:53 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E06CEC061574
        for <linux-i2c@vger.kernel.org>; Thu, 16 Sep 2021 07:52:32 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id bq5so19728166lfb.9
        for <linux-i2c@vger.kernel.org>; Thu, 16 Sep 2021 07:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=YCsNqZQmWCllDrFrMFT6BcZJL1H6jlyehcon3HTOdRc=;
        b=KOzHtcj74qb0UUCs8gfjXnIOpIa+N1VQNfPsC1iybbjIj9DccK12Hetwi8QI1Rob8C
         +Jm0A8q31kAyRHaQQJTwAVFKsD+GuWgPaeMF9NA4PIY8W1QHG64YBFhDUs2ZxVfpCSQM
         BsVUMY0Vxrs2eP81OLzYyeQP8/S3AN7UMOOeRUph/pMbeKVZYgEKpKDWMhD1TXCSXrQi
         F6UISoc7Z/+AjCdxD/QqcS/6QNSHtZn5bSdm17hj9KSvTDNXQm2dS9mIrs6eeM/zhlXI
         b2Y4OYmGCLW6W1yrRxXllmrQDa8Ngg8OcOX60soIuzNp51Xk06beMa+InXIxeLCnx+3D
         0gaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=YCsNqZQmWCllDrFrMFT6BcZJL1H6jlyehcon3HTOdRc=;
        b=gaBPhvZHqQN4HHexjo73eUWOenx/RDwwLoiHY9KBgbcwLeTAXJLBJYk9p9DD+b3QKR
         3ejtfy6YdVyLHWnXDEPqXjLKUgfi9aDAipSf69ubqM0bMT9OhW04N2tmAoxbcmda6INE
         nF2/AjoO7xXpvH6dGueJv3ezFZtbnRrd2LjArWRCVtfeZqNsbCv7iGoS6eeyTIaQ+oa1
         PF9x/tnmtTmWZ21iuAc98H9o7kXDptbZIPHUqWTB43BcrNbSUay/A8tiewvm98+KFc0+
         jFgglihHs5NGtv+KLMpHZLtWIX1vAX/W2Hi8O3gEuog+fAPDjnuhdVgP+i/OCu4loP9A
         bDAw==
X-Gm-Message-State: AOAM532OloBJT6XSZ1mL/t3Oe4RZ07gEnCOkbltKhlqKiIra4F1aRy/z
        SzdwwYVBFZwWzpoB9fikV5HQCI2ffktkPILP83U=
X-Google-Smtp-Source: ABdhPJzI1vXatgdsRmMHLfgyN02QlAyABdD4eb7zhbSl+S/GXgLHyyN8zorr8XZ7aVpGkH/2yN+CuDWrkHSRHeutwC8=
X-Received: by 2002:a05:6512:3b88:: with SMTP id g8mr4324785lfv.53.1631803950927;
 Thu, 16 Sep 2021 07:52:30 -0700 (PDT)
MIME-Version: 1.0
Reply-To: mrsdaniella.kyle@yandex.com
Sender: mrsrachealgoodluck1@gmail.com
Received: by 2002:a9a:7f4a:0:b0:138:dcf7:c352 with HTTP; Thu, 16 Sep 2021
 07:52:30 -0700 (PDT)
From:   Mrs Daniella Kyle <mrsdaniellakyle6@gmail.com>
Date:   Thu, 16 Sep 2021 07:52:30 -0700
X-Google-Sender-Auth: nWcKkEqaYiq7v1TB11tTxFr6e_o
Message-ID: <CAAQ9gCcTjWpPUhW1166VCj=TAOwTVoP-cOC4zy5w78Xxxpo7kg@mail.gmail.com>
Subject: Re:ATM Visa card compensation, Thanks for your past effort
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Good Day, This message may actually come to you as surprises today, To
be very honest with you, It is a joyful moment for me and my family
right now, so therefore am using this opportunity to inform you that
have successfully move to Vietnam where am currently living with my
business partner who assisted me to complete the transfer, but due to
the willingness and acceptance you showed during my pain have decided
to willingly compensated you and show my gratitude to you with these
sum of $950,000.00 Nine Hundred and fifty Thousand US Dollars).

I want you to accept this amount it=E2=80=99s from the bottom of my heart,
have issued the check and instructed the bank to roll the fund on a
master card for security reasons, you can use the card to withdraw
money from any ATM machine worldwide with a maximum of US$10,000 per
day. My bank account manager said you can receive the card and use it
anywhere in this global world.

 Go ahead contact the Global ATM Alliance directly with this below
information. Email Address:   maastercarddeptme20@yahoo.com

The Company Name: ........... ....... Global Alliance Burkina Faso
Company Address; ...... 01BP 23 Rue Des Grands Moulins.Ouagadougou, Burkina=
 Faso
Email Address: ..... [maastercarddeptme20@yahoo.com]
Name of Manager In charge: Mrs Zoure Gueratou

Presently, I am very busy here in Vietnam because of the investment
projects which I and my new partner are having at hand, I have given
instructions to the ATM Visa card office on your behalf to release the
ATM card which I gave to you as compensation. Therefore feel free and
get in touch with her and she will send the card and the pin code to
you in your location in order for you to start withdrawing the
compensation money without delay.

Let me know as soon you received the card together with the pin code.

Thank you
Yours Sincerely
Daniela Angelo Kyle
