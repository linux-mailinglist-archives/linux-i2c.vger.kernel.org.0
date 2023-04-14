Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 736D36E22C5
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Apr 2023 14:01:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbjDNMBX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Apr 2023 08:01:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbjDNMBW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Apr 2023 08:01:22 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC0D57D90
        for <linux-i2c@vger.kernel.org>; Fri, 14 Apr 2023 05:01:20 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id h198so25038469ybg.12
        for <linux-i2c@vger.kernel.org>; Fri, 14 Apr 2023 05:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1681473680; x=1684065680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Su4Rt8dGy/VJoS9Bkn3YputslqAEyC3EV4AY3JIKxaI=;
        b=TLztoKDV2OtcCMmySsRlm9AuH1jZk7D05KkgA+CH9qoSXAkPe6wGhZllwO+6MbKAaL
         9YwYUXBc/0tkRS6x4+TPuXXSh30qUlAr8PbQVTzfzcHGiJr27EzWmuRonEy+4RXQmKp0
         vELthvx4fjiVROv9hFmPLJZj0+EDZ4gLHzxXVXKw1Id3huPC+FeY7+Aj4EOR7kzbUf1i
         BJd9B8lO52nXGaPGfvxdDm/C7vkCwM9O0QNQbJ9cj8D2t45v3LOCHhGuGc9PfrG1pZW9
         3RpOITQ8BZtl3vphvi9QmBUOp7KoQucrRJq4cEMS5szeCoewD7SgLD+qbhsAZ4+ltQES
         iqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681473680; x=1684065680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Su4Rt8dGy/VJoS9Bkn3YputslqAEyC3EV4AY3JIKxaI=;
        b=fxa7q8yo9W0pSWZMnyvehgE8vhG+qZCZwBl+2dOv5Eg7lQ+Kg9A+ihAP2d4+SbqFH/
         J0oXnM6eSbtlffbMMbnx85LYObBq0d3S7kPgkPOtFrwl3jyz5Qa/dISxmT+jgxJ3UKuJ
         VHjiQ/eHkH8h+xdBCsAMuGHN8HlTii34ZnFBvkEbRJlqby3HA7uDtAk57EzG7xriOm4f
         Ffw2zepTeZkGK98RDt1U/RdqOkbGBig3d737U1kpfZqFdYszTR31OYV8lZoVNrfgA3gp
         erjQ3fM5ecIO19EofKNGrTK3E/iXE2kOVB6rhs/27/AV1/f8Mgik9N2Dad7SKbXwTHE0
         9U5w==
X-Gm-Message-State: AAQBX9ewIlTW5srYHyQX4oGsmGMFe/iQ6Qm/JyGsShYAK0y6i+ow3Swy
        SMYNFkPp2vjFZMCSmVimcLsW3K38yvbCaVkgzik4Vkc+n1yC/7e+49s=
X-Google-Smtp-Source: AKy350ZtGyDwLdggGWhyIcUinTYIudsC4I7VA1P3iEtwPZlQB7waxS1ov3Dskq7DilcjkDPn69QwS9QBMsILJFIFzH4=
X-Received: by 2002:a25:ca83:0:b0:b8f:6944:afeb with SMTP id
 a125-20020a25ca83000000b00b8f6944afebmr1718279ybg.3.1681473680022; Fri, 14
 Apr 2023 05:01:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230414110137.401356-1-patrick.rudolph@9elements.com>
 <20230414110137.401356-4-patrick.rudolph@9elements.com> <84a81f6a-4a35-4b30-8a5a-6cb0eba37594@sirena.org.uk>
In-Reply-To: <84a81f6a-4a35-4b30-8a5a-6cb0eba37594@sirena.org.uk>
From:   Patrick Rudolph <patrick.rudolph@9elements.com>
Date:   Fri, 14 Apr 2023 14:01:09 +0200
Message-ID: <CALNFmy0RwiyLAAd_vOYxY+yhRn7cnP6Xw=okH17OQ75_vQ3BcA@mail.gmail.com>
Subject: Re: [PATCH v11 3/3] i2c: muxes: pca954x: Add regulator support
To:     Mark Brown <broonie@kernel.org>
Cc:     Peter Rosin <peda@axentia.se>, Liam Girdwood <lgirdwood@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Mark,
It was using the normal regulator_get() in the last revision, but
Sergey requested to make it optional.
Please advise me what to do here? Who is right?

Regards,
Patrick

On Fri, Apr 14, 2023 at 1:47=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Fri, Apr 14, 2023 at 01:01:36PM +0200, Patrick Rudolph wrote:
>
> > +     data->supply =3D devm_regulator_get_optional(dev, "vdd");
> > +     if (IS_ERR(data->supply)) {
> > +             ret =3D PTR_ERR(data->supply);
>
> Unless the device can work without power it should be using a normal
> regulator_get().
