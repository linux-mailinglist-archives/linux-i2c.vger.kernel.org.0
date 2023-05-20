Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41FF170A498
	for <lists+linux-i2c@lfdr.de>; Sat, 20 May 2023 04:16:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229951AbjETCQ2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 May 2023 22:16:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230415AbjETCQ1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 19 May 2023 22:16:27 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AC35E5F;
        Fri, 19 May 2023 19:16:22 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-5346d150972so2478178a12.3;
        Fri, 19 May 2023 19:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684548981; x=1687140981;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lFgyeYw4uPK6HO8hs9FRdVOfgCGNivxnwmXr9VMJrDo=;
        b=DoD8GwmF2nlWu+yHJ3xHDVInM293//B2zW3ZK73ZkXnOZeVJNv1G91PULPGAOZJLRX
         wzxIwTxaouX37dwag+QW0ieFMFiiVmx0RWrD6jUjOH6fv1xHGzn7k/E2Oj8YPeHXBBkX
         u0fShKanlW6S+FA9ENGR/kpgjexVAXoWjJJ7PJxN81rYNljeE3NmnivGaBtoJlvcfIPv
         Om/06THeksmrbjY7sW4hdtbTvc2xG/zBLKrZ6LFq7WFPYcjv99sTUYaIGkLYnEHHlu9m
         4dW3aYROEM8yzwHPuBdCekQ16zm2Hv1DEDHYbdUlh6CLFVMKklt0c3odVWBDtzgNFOQE
         KwZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684548981; x=1687140981;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lFgyeYw4uPK6HO8hs9FRdVOfgCGNivxnwmXr9VMJrDo=;
        b=Re1K68ZWgLt4Rcb376P5dRIwmJO+S0VQYtoYHu6ze99sl/O1JwCrewp8xldSw89g3z
         9A2dapAkGu2YkpITYzgzKa2x83GE2l+EUGv60e/DVcC/73OHU36IWB832lV+L0948lGt
         9Wu/m0tiuFxnkKzvCslJnF0JIqLry0nIAkKQYRSuPTQe1V4L+Ua9bEbGtuzE4UBMwbOX
         XNtiApg8EVLXnNE0d0kNg66asA/yE4udl9+XNzL0mDgsJMsCAlFymWvHEDriork2+gLt
         YUOj6ezgWpkR+RHkIu9log9XlpdJDEMIGojhYaZJYqTPqSSHJ9ZkFC5TiQBbbiwNQTFz
         sFxA==
X-Gm-Message-State: AC+VfDzntF1N2euuicR0NyiFfuBRREKpY274UXjQMd9Gubse6ejhPavO
        8NiiG9mWlgnVP0e46DRJ7MA=
X-Google-Smtp-Source: ACHHUZ5uDX9A05fqyl3r2z7ZsQfBkXnB/zDTEtuHhK4CITCJcUviCGg40/57dB4lFG3yVKDfjiQfow==
X-Received: by 2002:a17:902:d382:b0:1ae:3991:e4f9 with SMTP id e2-20020a170902d38200b001ae3991e4f9mr3897402pld.61.1684548981433;
        Fri, 19 May 2023 19:16:21 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-25.three.co.id. [180.214.233.25])
        by smtp.gmail.com with ESMTPSA id jh12-20020a170903328c00b001a19f3a661esm295628plb.138.2023.05.19.19.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 19:16:20 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
        id 988531069E8; Sat, 20 May 2023 09:16:17 +0700 (WIB)
Date:   Sat, 20 May 2023 09:16:17 +0700
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Regressions <regressions@lists.linux.dev>,
        Linux Input <linux-input@vger.kernel.org>,
        Linux i2c Devices <linux-i2c@vger.kernel.org>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        kolAflash@kolahilft.de
Subject: Re: Fwd: ThinkPad L540: suspend not working (deep / S3 / standby,
 regression Linux 4.19 -> 6.1)
Message-ID: <ZGgtcaGIECpaXKvp@debian.me>
References: <73883c7d-42db-7ac6-fa43-b9be45cdc795@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wREUupUIgHJ2Wbjf"
Content-Disposition: inline
In-Reply-To: <73883c7d-42db-7ac6-fa43-b9be45cdc795@gmail.com>
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--wREUupUIgHJ2Wbjf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 19, 2023 at 08:19:39PM +0700, Bagas Sanjaya wrote:
> #regzbot introduced: v4.19..v6.1 https://bugzilla.kernel.org/show_bug.cgi=
?id=3D217462
> #regzbot title: psmouse suspend failed on ThinkPad L540
>=20

The reporter had narrowed down possible culprit commit range [1],
thus telling regzbot:

#regzbot introduced: v5.16.18..v5.17-rc3

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=3D217462#c3

--=20
An old man doll... just what I always wanted! - Clara

--wREUupUIgHJ2Wbjf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZGgtZQAKCRD2uYlJVVFO
o9aLAQC6hU7NN4GSTfBKgKeqs8JmCvfJgpTt6DbB6FgDW1030AD/cTZsWR+xE1xU
pw87w0X/mt7M0TWhJbvezzYs/i/cIg8=
=s0ct
-----END PGP SIGNATURE-----

--wREUupUIgHJ2Wbjf--
