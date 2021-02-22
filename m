Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A8993212F5
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Feb 2021 10:22:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229943AbhBVJV6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Feb 2021 04:21:58 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.217]:30982 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbhBVJV5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Feb 2021 04:21:57 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1613985234; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=b7BHV9lW7x38COxdFBnhfEToY4sx6jZTZmPu10cMnXN5mIq++skZbhAuS3lbalyv5Q
    hSgLDGWB0MRJB3Gh2Dx5abaTyv2dcSFsIT15OiSl40puG7aeqIlTg5Z9effw3mLvA126
    mvDiHpdCLmvS79UGJ9h/QbhY8KKJUME4XiHr/WkbUrlygv+Cqq16pgm23vV/BOrmmPT8
    KeRiudqEA4NnOO7YdAQkPzE8Ig8C98IHJsl9ZWi4BEgNzXABauMA/Imuh0vNAvffxk60
    PIqSa5x9psVreh727dVyU3pvYMldWhwK80YGf8QYDaYq6VxDWO1oQ4J3uV4Z+8Xe2o6X
    BI+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1613985234;
    s=strato-dkim-0002; d=strato.com;
    h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=sAqJ2eEdQkpNrhCqjUSkVvA1IHlPiHaGXoRF7SefrMs=;
    b=SN0RNT2k+WS2rLRhz8g7LXTIiityRY2H5fUxRWlBZrgo8YUXJyd/hBf6YuZEABw5Dy
    V+miZzfk0UiIeSsizUoNNAgQDCh0YBzov3ojwS7bou0QkUXd6vdz1X40vjO6dBvp1MNF
    mB1EpfvNTXbCiMHaoSk03rHFDwMYcDoq9ea4XIVaF7tT57Wkpvlh2oAGeeU56bIbXBoY
    kMZ4oFlNWn5/YT+whlpVgzEZNuRI++n/MDvreh0A+Q0iEFX6RUOISACB8cr1nnc1QUAt
    e2HQggnPjl6k/pt8k1jXTnfJHJGg97wfKFnAzo7WQjiMtLvs5wjRJA9egZjhBv35hR35
    W0nQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1613985234;
    s=strato-dkim-0002; d=fpond.eu;
    h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=sAqJ2eEdQkpNrhCqjUSkVvA1IHlPiHaGXoRF7SefrMs=;
    b=JDkQSMRBRyEFakQKyg/3/gR76vJvFG9NDBBmBJyGUeT8yY72X1avMw747x0WcJy5Qi
    NTtRhaBkz9DF8pv8uYpNszwls+/nCksTYDVVfDZ9gdMnV/Slo56jYrsv/7rIoDZ6iX1A
    JHfHmD3qCKPesP796jEGTE+Ykxc01QtVUbFNoTPRCiGwcbxUG8ktp7MGQys5BzHjL9og
    uFOnFjGPaJH2LWxcWGrjCRNpswC2PTghgPQ0HeDkRbNsaffaAjUZ6l0ZVDGvlviUJ0eN
    bTIHdT97/V4RBQz5zuiGj/dLSyaTLUdXUbNOXH3ICC5pzXd5d9Y0O8heYD8qTpy0/L2h
    RxlQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzvv3qxio1R8fGk/2qthug="
X-RZG-CLASS-ID: mo00
Received: from oxapp03-01.back.ox.d0m.de
    by smtp-ox.front (RZmta 47.19.0 AUTH)
    with ESMTPSA id I05ee3x1M9Ds5ou
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Mon, 22 Feb 2021 10:13:54 +0100 (CET)
Date:   Mon, 22 Feb 2021 10:13:53 +0100 (CET)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org,
        linux-i2c@vger.kernel.org
Message-ID: <729222942.290543.1613985233840@webmail.strato.com>
In-Reply-To: <20210219120142.GA32306@ninjato>
References: <20210212164541.8986-1-uli+renesas@fpond.eu>
 <20210218104936.GA890@ninjato>
 <1817984199.148366.1613664221431@webmail.strato.com>
 <20210219120142.GA32306@ninjato>
Subject: Re: [PATCH] i2c: rcar: implement atomic transfers
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.4-Rev18
X-Originating-Client: open-xchange-appsuite
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


> On 02/19/2021 1:01 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> From a maintaining perspective, I think, though, we should have only one
> master_xfer() function and use 'atomic_xfer' in there to skip stuff etc.
> Otherwise fixes in one function might be forgotten in the other one. Or?

My guesstimate is that the amount of code required is about the same for both approaches, but having two separate implementations makes both of them a lot more readable.

CU
Uli
