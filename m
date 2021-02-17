Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D6A831D35F
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Feb 2021 01:20:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231303AbhBQATt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Feb 2021 19:19:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231489AbhBQAT1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Feb 2021 19:19:27 -0500
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CC2BC061574
        for <linux-i2c@vger.kernel.org>; Tue, 16 Feb 2021 16:18:47 -0800 (PST)
Received: by mail-io1-xd2c.google.com with SMTP id e133so12048281iof.8
        for <linux-i2c@vger.kernel.org>; Tue, 16 Feb 2021 16:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=jTVlfIINqTw0v4Efkeelt0x7KWMArOQ/VsKT2nrF4AQ=;
        b=T5/p18DPzvbD7cCwPPlo/f+paDltHHa+jjG7Uqxu2GXeOCUlMKsfz7mQvlsVsbA6t9
         X0zHCPmfcJE9KiVjw/wuQcQofj623t383yQFHh40IXOLiHWvksgwmW8jjsAvQF0XHCe3
         CMMt8cFxZC0bYKmKfSlKOwSvpDGRZ6ZrkD8bSTnVLg0qNOfUgseUBbwi8eGWifzn5dUE
         Q+5RBgsuBahfCWnh0N93R6J/zsx5BHwKnp4U8sALIvcRvEH7GCvfk4dqE2dALhGTd2OQ
         y0XM2wmPqzKNb9zcWyRAk09hbqg8ed6SDPNeSc6H2ISqujIwYYIRNtvy7JpcX4cyAJNA
         ih6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=jTVlfIINqTw0v4Efkeelt0x7KWMArOQ/VsKT2nrF4AQ=;
        b=Uq/k8dG07IToK4x4lFX2JCUYdPGtAcsm76P7fNNBsIn/GL+Fo3VrW+wNPjYLoSKIbd
         5yKjAgHlYdcqncyAIA9/qFvFTbBP8maPJ6qs0WptK4V2qlHX3Gvgpw1f8Zux9Rlx/nvw
         HvHYtpheLwG26By1fjeJUWqiJveWftcMBM0L+BUiWqBFpOCUzyjaIJAovF9D99wJ4fIe
         LTTFsS12sic+SrPJxqP2Ee+u1UNIvTT5lAp/ZDbL6K1XRHu8BRmhSaBxUI5PZADmnqLk
         9Mz8aWyJQSpmBe5E6+9kpYjhA2UBgyu9RiKHTQOd4zu3fMbzrulumg0Wy5VYxapueZSl
         kzvQ==
X-Gm-Message-State: AOAM5336mUucJ8cxR4jO1myhHaq9KXXU6PMBzggMcdKpblBEbJYdPJS+
        f9lkNw6Fe2612il0MketCMwJZ9dHDGTyfcsyaZE=
X-Google-Smtp-Source: ABdhPJxlaQcpyqc4ledhjx2/tZ8P88AqQQDNP+iRP4dAkvm+hPW2/5yGaUe8X0MrNNDHSI1VPjgywFG0RpAbCUdwri8=
X-Received: by 2002:a05:6638:2411:: with SMTP id z17mr11848278jat.29.1613521126766;
 Tue, 16 Feb 2021 16:18:46 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a5d:9856:0:0:0:0:0 with HTTP; Tue, 16 Feb 2021 16:18:46
 -0800 (PST)
Reply-To: charlesjacksonjrc@gmail.com
From:   Charles Jackson Jr <danjerry1997@gmail.com>
Date:   Tue, 16 Feb 2021 16:18:46 -0800
Message-ID: <CAEJOpTdbtMn2GevZdt+UcioXNk9iaHoj-FFaSxnuv9ESXaNetQ@mail.gmail.com>
Subject: =?UTF-8?Q?Antworte_zur=C3=BCck_f=C3=BCr_die_sofortige_Inanspruchnahme_?=
        =?UTF-8?Q?deiner_gespendeten_Gelder_und_Gl=C3=BCckw=C3=BCnsche_an_dich?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--=20
IHR E-MAIL-KONTO WURDE F=C3=9CR EINE SPENDE VON 3.500.000,00 USD F=C3=9CR
CHARITY AUSGEW=C3=84HLT. Antworten Sie auf die folgende E-Mail, um weitere
Informationen zu erhalten

E-Mail: charlesjacksonjrc@gmail.com
