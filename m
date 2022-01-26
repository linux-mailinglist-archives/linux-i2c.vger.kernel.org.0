Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E50E49C6F0
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jan 2022 10:58:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233093AbiAZJ6b (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jan 2022 04:58:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232927AbiAZJ6a (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Jan 2022 04:58:30 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9116FC06161C
        for <linux-i2c@vger.kernel.org>; Wed, 26 Jan 2022 01:58:30 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id a28so31856992lfl.7
        for <linux-i2c@vger.kernel.org>; Wed, 26 Jan 2022 01:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=L6ZiA+lCLwuRLTRReryqbRPsvG1oUl95IiaGSj289ZU=;
        b=VJYw0lqxKE9l6UDqb7NE3QjdMnv+BYFdC+9bQXR3MglKawBDUkjBxpUQlmFD+efFGl
         u54s0ej8arXZzJUJv8zBc9cVW4fxM33AlDgOEC2tV89smpj4wmJWZPOMZkBLGG5PZnGR
         sfNF9kGdLcsLKG2H5UiFs5/rvxnXJgmShUlrTdnmg5abN6D9MC1cdg9koPHC+vw1FNCC
         kdDbXgwO419kIKtIQ9Gm5vUaKv6Ry2Zqjsvo9/VetfDhl88MONlqigeeaKz4RWR6j4B3
         AuK5Pj/IBiWNMG5UK+/T55KYHLPMc2j+cjssUB0+eLwZkwna1CB4mvDXDAkeAhTtcPfk
         XH0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=L6ZiA+lCLwuRLTRReryqbRPsvG1oUl95IiaGSj289ZU=;
        b=fCQwEMnwPtlAPBmjeOG7bJfiwPFUAXkncTBKn4g0xNvPaDRZk/uGgYuLRkOQg8QsD4
         nAp4l1StLoWnOL/hEuT8yQ3A00CdwHSg/3idEPvPhCDSlfSyrMGSpwMOYi7D1rBWqCaQ
         rRFe4oRfpmg2/QjTf4TvjC4PDYK2Ww714TdLfWON1/PdV7CEpr9a6Cz707rxUtKyMv+E
         X7HTsDI/MVCdDNH891migwsaXOIMjD5GmCt9xIwwqIhFXSw1PzI0GAuyJltbx4rU9WnR
         uOr0kEeYfXu5P9hO+zMTljYrGtQDWtkn6DvIvXfnKjd7w8TWgCfc/36eIbh47lfKp9Rh
         zduw==
X-Gm-Message-State: AOAM530Se0yQWMeVVisY8JIpCedYci1ISmEcCCXbzN7G5K6dJrlPMsk8
        xiWgKvtG372t3Kyh4B6lnX68plhV3BUlGxWxQZI=
X-Google-Smtp-Source: ABdhPJxOvB5ksTPj4Pjs/J+fWaIzost3Kwp4osS9zPrZq1i33emPxZMVlP77DzfqTLrBrS5E4ZPCXb7atxz2QnMBAuk=
X-Received: by 2002:a19:8c4a:: with SMTP id i10mr19082940lfj.537.1643191108974;
 Wed, 26 Jan 2022 01:58:28 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a2e:a54c:0:0:0:0:0 with HTTP; Wed, 26 Jan 2022 01:58:28
 -0800 (PST)
Reply-To: hegginskate7@gmail.com
From:   Heggings kate <heggins35@gmail.com>
Date:   Wed, 26 Jan 2022 09:58:28 +0000
Message-ID: <CAH=nmxaN45dkkU592UJMtN9UckK37OyEwRygO9-jwmfHj085rA@mail.gmail.com>
Subject: =?UTF-8?Q?D=C4=9Bkuji_za_va=C5=A1i_laskavost?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

QWhvaiBwxJtrbsO9IGRlbg0KICAgUHJvc8OtbSwgbcWvxb51IHRpIHbEm8WZaXQ/IG3DoW0gdsOh
bSBuxJtjbyBzZMSbbGl0LCBwcm9zw61tLCBva2Ftxb5pdMSbIG1pDQpvZHBvdsSbenRlLCBhYnlj
aCBtb2hsIHZ5c3bEm3RsaXQgdsOtY2UNCmTDrWsNCkthdGllDQo=
