Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5ED565A118D
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Aug 2022 15:10:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242355AbiHYNKo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Aug 2022 09:10:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242370AbiHYNKl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 Aug 2022 09:10:41 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9886FA4B17
        for <linux-i2c@vger.kernel.org>; Thu, 25 Aug 2022 06:10:38 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id bd26-20020a05600c1f1a00b003a5e82a6474so2494523wmb.4
        for <linux-i2c@vger.kernel.org>; Thu, 25 Aug 2022 06:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc;
        bh=CgPmC/LE8MN7k+A5AV66PXFkII1kqqv/gtUGu1FRqHY=;
        b=Z9fKoqePFxuk1naX9HE3+LMCJELCS3nBRXhd+GohUVdMQXiUbS18cWCHS8y/Vc6z0q
         LbJbhrZ/pBmRF6h2Ek/rCCR07V2jSEcsUZGOpPBgaIPBJzGPGvRKBRzhdRxNCmJNHcsF
         ED4ziDTFAabIaoQhPVuZEjNTgEfSClCVWs6nRWkppVhFL9GXDsVhEJxSIWQuFOBRQx9O
         lsYegMZPNU2M5GXqBHLTpvskxXdmLs7IH++eEXstByAspz9tRwltmBhvs7qGWqVHbEcW
         juLLjALL4fkm0ifaYzDWI84225fGaTw5LiVmTLLJSOyp1VsqvDo7zzYSZrWxA1h+cB+N
         M5ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc;
        bh=CgPmC/LE8MN7k+A5AV66PXFkII1kqqv/gtUGu1FRqHY=;
        b=dwumW+rkKKO2wEkrxqBKio2XN2HGhpFnwyhY0+fa6a+EPGk730TAp956c1gpNeWXmX
         7JQ2rlgO/oafuXWvAKALv1O4dWWOfIuM/O1nkxT8CLHUS/MulHjnCjpJMWNqJUIUvQR3
         +lHGdwIrgOyg8xwqWoRh+zc6/rxcJ5GTW+Nl22b4mQ5fgiG9gdDj9VwJaxMRSCz2UT/+
         l0bjBRZlDHvyjEYpO38HjSk98YwvDVJWliL3TEXGbcRyz+dMpxX6iixVcutM6N5O2PYv
         0cje+NMuG0DYmg6XB3Fdmh9FvhD0MePTVPdHxLkt3MvQZSEfFQ3hJmbEWQDZHW97HErU
         zFag==
X-Gm-Message-State: ACgBeo3zkqIDGcidIii1MeGmpps46RvYlBj+d6xEO4ihgI/rSVS/GT1S
        am0sLtUp66vGxjUqA7xb6eU=
X-Google-Smtp-Source: AA6agR7S+yfgRXxfN1kOlc0dszE+EN8WqAVq0QEJe4QUmxg6BKuGsYP29Yzv9Fl3oxKxbTXurL04BQ==
X-Received: by 2002:a05:600c:17d0:b0:3a6:8235:504e with SMTP id y16-20020a05600c17d000b003a68235504emr2194525wmo.58.1661433037032;
        Thu, 25 Aug 2022 06:10:37 -0700 (PDT)
Received: from [192.168.0.131] (sgyl-45-b2-v4wan-163690-cust138.vm6.cable.virginm.net. [77.99.130.139])
        by smtp.gmail.com with ESMTPSA id f16-20020a05600c155000b003a5c75bd36fsm6118971wmg.10.2022.08.25.06.10.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 06:10:36 -0700 (PDT)
Message-ID: <2e4877a8-5f5a-6a0c-0477-b190887a1176@gmail.com>
Date:   Thu, 25 Aug 2022 14:10:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] Fix typo, add markup, fix URL in i2c-piix4 docs
Content-Language: en-GB
To:     Jean Delvare <jdelvare@suse.de>, Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, trivial@kernel.org
References: <20211215113356.62982-1-bwduncan@gmail.com>
 <Yd3mypbrlKk/nc0e@ninjato> <20220825145032.7ab0b3ab@endymion.delvare>
From:   Bruce Duncan <bwduncan@gmail.com>
In-Reply-To: <20220825145032.7ab0b3ab@endymion.delvare>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------a3PCh0FtRIaeRI7FJS65DKAc"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------a3PCh0FtRIaeRI7FJS65DKAc
Content-Type: multipart/mixed; boundary="------------15trd087ZFOgdrW4XNaDLN0N";
 protected-headers="v1"
From: Bruce Duncan <bwduncan@gmail.com>
To: Jean Delvare <jdelvare@suse.de>, Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c@vger.kernel.org, trivial@kernel.org
Message-ID: <2e4877a8-5f5a-6a0c-0477-b190887a1176@gmail.com>
Subject: Re: [PATCH] Fix typo, add markup, fix URL in i2c-piix4 docs
References: <20211215113356.62982-1-bwduncan@gmail.com>
 <Yd3mypbrlKk/nc0e@ninjato> <20220825145032.7ab0b3ab@endymion.delvare>
In-Reply-To: <20220825145032.7ab0b3ab@endymion.delvare>

--------------15trd087ZFOgdrW4XNaDLN0N
Content-Type: multipart/mixed; boundary="------------uYx1dhFXwMeV9v41zUKQXcr1"

--------------uYx1dhFXwMeV9v41zUKQXcr1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCkkgd2Fzbid0IHN1cmUgd2hhdCB0aGUgY29ycmVjdCByZXBsYWNlbWVudCBzaG91
bGQgYmUgZWl0aGVyIHNvIEknbSBoYXBweSANCmZvciB5b3UgdG8gcG9zdCBhIG5ldyBwYXRj
aC4gTGV0IG1lIGtub3cgaWYgdGhlcmUncyBhbnl0aGluZyB5b3UgbmVlZCANCmZyb20gbWUu
DQoNCkJydWNlDQoNCk9uIDI1LzA4LzIwMjIgMTM6NTAsIEplYW4gRGVsdmFyZSB3cm90ZToN
Cj4gSGkgV29sZnJhbSwNCj4NCj4gT24gVHVlLCAxMSBKYW4gMjAyMiAyMToyMTozMCArMDEw
MCwgV29sZnJhbSBTYW5nIHdyb3RlOg0KPj4+ICAgRm9yIGFkZGl0aW9uYWwgaW5mb3JtYXRp
b24sIHJlYWQ6DQo+Pj4gLWh0dHA6Ly93d3cubG0tc2Vuc29ycy5vcmcvYnJvd3Nlci9sbS1z
ZW5zb3JzL3RydW5rL1JFQURNRQ0KPj4+ICtodHRwczovL2h3bW9uLndpa2kua2VybmVsLm9y
Zw0KPj4gSSB0aGluayB0aGUgcHJvcGVyIHJlcGxhY2VtZW50IGlzOg0KPj4NCj4+IGh0dHBz
Oi8vZ2l0aHViLmNvbS9sbS1zZW5zb3JzL2xtLXNlbnNvcnMvYmxvYi9tYXN0ZXIvUkVBRE1F
DQo+Pg0KPj4gPw0KPiBZZXMsIGJ1dCBJJ2QgcmF0aGVyIHJlbW92ZSB0aGUgcG9pbnRlciBj
b21wbGV0ZWx5IHRoYW4gdXBkYXRlIGl0Lg0KPiBUaGVyZSdzIG5vdGhpbmcgc3BlY2lmaWMg
dG8gdGhlIGkyYy1waWl4NCBkcml2ZXIgaW4gdGhhdCBmaWxlLCBzbyBJDQo+IGNhbid0IHNl
ZSBhbnkgdmFsdWUgaW4gbWVudGlvbmluZyBpdCBoZXJlLg0KPg0KPiBBcyBCcnVjZSBhcHBl
YXJzIHRvIGhhdmUgdmFuaXNoZWQgbWVhbndoaWxlLCBJJ2xsIHBvc3QgYW4gdXBkYXRlZA0K
PiB2ZXJzaW9uIG9mIHRoZSBwYXRjaCBzaG9ydGx5IG15c2VsZiwgaW5jbHVkaW5nIGFub3Ro
ZXIgdHlwbyBmaXguDQo+DQo=
--------------uYx1dhFXwMeV9v41zUKQXcr1
Content-Type: application/pgp-keys; name="OpenPGP_0x3D3BB36EBFD0445D.asc"
Content-Disposition: attachment; filename="OpenPGP_0x3D3BB36EBFD0445D.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsDiBEiYUxARBACN2TS1EgFu05Z+FiSXzmDUboWr8LLIKPdRKPiWUgbwm5N8D72+
QhuBVh4DXDQPJo67vRUVGDBCQQ47A4+E6lB6wwFjsdNI5bvay5KUr9r+m4zWw4tr
JUtGkaislivqlzmeK/2UJifDk2RGbZGysQEu43saDnqzw0WLk8m2IebVKwCg9Wco
/etKTYzn2EiN+Db040JTlJ8D/2w1ML1avE0DmOBBI1XgsKAJYO4axfJJgDOOdz/d
TmINMvWP99Poa+3Ryp41i5Wp5A5sAGh3ceuVeJho7ZVuvW4GRv9iOikBjnfJDnni
Zws1KilRMJnqCyNaZyhvR55IxX9W1nUWrN+nQiKXnwIXPn5dN5oFaZm2fpbrug2/
3NygA/9NQJ96TXJjdFEjKGMviZh1cALmZEPw21SrkA+Knpsqtzyfjbf60vi0i7wh
ABeIaK0T7cCkPQ3oMkO/gFxRaovCzZcCGsu17ilF37ynI0Ntvt1p1+vM0dY30cE6
1aI8awI5nxnCMQS5fLEQi9cBm3zMYxuDBmu2ddpTp4wRmHw+UM0kQnJ1Y2UgRHVu
Y2FuIDxCcnVjZS5EdW5jYW5AZWQuYWMudWs+wmUEExEKACUCGyMCHgECF4ACGQEF
AlLqaAMGCwkIBwMCBRUKCAIDBRYCAwEAAAoJED07s26/0ERdKiAAnjLqjmulVOi+
cP9lwSum9NhbdotrAJ0V4rM2cTGkdwxQLryBCKvqK/yTvMJGBBMRAgAGBQJImFQu
AAoJEMfuohojEXPpbPgAnjBB57Xk2ipdZQj/vXBfjIAo5Qw2AKCxdQbbSivUw3go
NSxoV4w3grG2ZMJGBBMRAgAGBQJImHgGAAoJEEVqYtVmAkHSupAAn3Dglzw+cH9v
A8QBd6KiiBLn6bNzAKDJU+qvax6/kxl32zlCsat6bXHkGsJGBBMRAgAGBQJImHhM
AAoJEEMBh5exXoHPff0AnjqwSAT3a9jytjI86+oS5DKCDmfVAJ9qb3TbGqzcc0SD
CjCbc693v1sCR8JGBBARAgAGBQJImaY0AAoJEIOLfJYsE7tYrwwAn3vIG0gYxACa
gwwYA0B9rjvPZKtMAJ9cVBe6D+emYHCb7ZMS6nvplNzTV8JGBBARAgAGBQJIqqAQ
AAoJEOUNBNK7C4nH+MIAn2Oi4pzcar+BtpQqMHOZvrCVV8/tAJ4vofhhC1yyDoJ0
4Ens2Mq5gF62RsJGBBMRAgAGBQJIrsebAAoJEOOkB1OyCHzAKc0AnR0Xd4JY2cK0
D495/sLx6NkkdJCqAKCqMAPZbHuiu0cUNQsrudQ+k7p3tMJGBBIRAgAGBQJK18D3
AAoJEGKLaCVFUAeCTV4AoITdz3p2ix28PZobMtgrP1QulJElAJwKbPVx4vxuHWx/
vI22Un0GyZH7qsJGBBMRAgAGBQJMTYxbAAoJEGa1RhKilzuB2PcAnA+b7A264cZD
HrpCBGAdhb1jbX4xAJ9fP9s9Cc752AkLfhyXAwvcnJp8ecLBXAQTAQIABgUCTEgo
rgAKCRDgD8qWrbi9TRgOD/9hPrCiGKKAYqDLZe7az/JmxE8jpIS8iZ6+Ztr/imB9
wj8tJ7S+MZh0bNjQDZF2sxdcYmOF0oNvh/MCiWOBraSyTivu1ccyX2tbUibvFoYD
mfQaneZDr+KaB2D48Yu/+yA9PVl7NaWEbD4wl/Qr0dGhRktAQBC/vyaH/pH+66nu
6Zwm6MxreWGfBXynsWljyhD8+TkvaGGo9DMcBaO2p6AQlILDkve69gakXqKdSqIK
jqygHep5g+5IOipxxsKSdlA6mdn9Y4s4QLNMRyzTCiulFO7sEO9EDTExlP+CHKc+
BM2REUqY2IYlMrLTd8eocmIeN8RYQaX3ciURVw/xH5DqLTJdYKJmWdawDKl8Xr2w
vp5xhTF0x+moxyNdP+D8tl+aSY/lbS0u294BsepaqqV5eVv9bnEn1I0okPgHdb1I
dZWxqcJsuLs726EXGZBSENflMU+vRlNK860WcruamD8mkLn5pF4E3OtMOXr+Ma2E
J2qbkMlpTJ503MX34jcqsaC6SK+ZtUFQ1ttZM4fFy/gJ0caGJpnLGumI+PwW5Cqu
3HrFWFdwUua5mdwbdeYgusJTjD1pNWIsifP5dxZGSbUVAu83acjfomFl/pBLU8hh
1bihsiMtlpMC3i8COp3TLqVLw6/5tr3Z5Uwrm1LoGSjBz6h/kFcih2lmzBYjlEFD
tcLAXAQQAQIABgUCTzxL7AAKCRBSrx9MrAFBvZKDB/0fSnq73gRta3IOiEmZ2RJL
xWhDXhjicdFq4dgV5dWZCQigBCBsEFm3BtsvOiQ7NjRpXzjmukLuxf9gtyyJ5zj0
dCa44k7vnSg0+BwXyNzixlQEPsVz9pO9xJZH3/jdNYO+dACvE0BALKTjvHbsQo/T
EltKvvxF4yzsUPsT9+JRZGDLUR73v63FsaKjoq8CjQJBOm4GBLkC6hhslelBSal+
rrntwf1BN64bVPeVW+nTICGA1ykdKudJZBgi26bhSvizfPGIa51Osp3dYekzScpB
5+tEpQ7u4QBBeokmX3yqmbA22d+5NHHdIW7T0xtgBCs2V/hFLO2ykT3C64zP3qom
wmMEExECACMCGyMGCwkIBwMCBBUCCAMEFgIDAQIeAQIXgAUCSJhUqwIZAQAKCRA9
O7Nuv9BEXdGoAJ44Jp2Ixqsy9Hul5b+SpPeIEXUC3QCeOM8dmuAw28wy7mmjYufI
5Xfc7+rCwFwEEAECAAYFAlLdqrQACgkQtrpGtLSzF2XUwQf7BVLOl7Wm4ciCtZEz
p+pCOXfH3LdWsWCgDeGMNdb9F7Zke6Kcq1FBc+c10XqZO1SFQUWMLg8aC7xzxnhx
ndqQSGv6vgiJFCj85uXakVBrI0NYVlnE0sw+E2YVI6AVkVPD7oWKvMqSq7Qlz7DU
LlzcfztXlXcOvFY3gX5zkYXYjn7GLR3/99niAiC7ofbQFoGLnLayVu4V8eQkfLkb
ZS9iP3mCiOxiMhHmCf74Nra4cGJ66ynh/0VUJdI5mK0CA/3cD7kATTcH6W/vuuu/
OiWMtvy+uRUdO4G6sJWl6pQSS2RC8402RWb/6z4aRf5aoC3CUxxtdPonWKqPME9U
oABWucLBXAQQAQgABgUCVRcwkAAKCRDq/P6/j+uOv3ATD/9DG498O9m3nnItstyt
QzHXxcNLtIeFn1JJiXPBiTo6kF6YhAfDuRcL0tzinmwyVWhmHn1ChR/VCRkIJeBe
BarLfe8OudE5L3tdHesWblkBPuiUKWBVq5oxOW7pDNMHB7L1o1AIY8uxxy8SZC/Z
gWrQpSxTA9SDZY0ETLxVttA+z4zsAGAbi6PZ0//bSz0YbG3KBbxedatQxNNjpqSA
44yRo1th0QLNtIWuPDkiPnHtNCBKXAa4R/TBJBt1dfeId50sJexElB9Q6mRaUB44
4evmo4yWJAzt8G5xdMX56DPyluwBig/TxAfX+7C4xrAZKrtH9ijc6+Ldn3ncZj8H
EimOt+hrK0b6igPKU0r/ybq+tUz8il+mgA0q3SdJi4eAbeNfEZkfMa3K+HASSLJZ
OYrtuJXfP/G1jFdPVtGbDZXZ1dhJAAVg/lYsgF8EZ55oPRjeNZoGX0jcOwChqVDI
AQTYEEWFHxwOQGMYM40QjiMdB/mWm4uQ3OjQBFyzxKOXLRCtzijXXxs2/FgXD5sr
OhtB+5VTdu/Ml10DXJJXGjua4Y/qHYm1Fm3XTMCD6buBI2QIztHdUApDCjPfWMOe
thJJmV2odcU+E/+PifZ/ymHoYCYEei4flO0+dYKNrox588a0icnaP04DwBA2EW/k
auj/zOCiVNbBGilZ4XuuyxD+VMJGBBARAgAGBQJVGVJMAAoJEAcAGcMqWMWAW9QA
ni6izw2j8Y0ARuqM+f1kZstN5EIJAJ9cW6wB7M5lyfwIHUNpaVMu/GEI28LBXAQQ
AQoABgUCVRlg2wAKCRAQYu3IzSp04w6gD/9sms5E7Wej7e1u5qTG0N6ojPstNJVH
YdBRqZ4INpvEw+91r5VV3UXCa0YOmC9NSHUlU0FkncQBjvBXPbCoHu/Tdb9CejIn
MHCm/f32tBwhIGQO6rQ+K9O9orhCbKkc2bzs67BUF9f2PwSQX3KsoVEIcNBGScIl
CxG9F94ODJ52Uqrav0EMX6/Uglq0Ip5SQ4xt1+ABrsrF+VTwN0bMSaGpc+mVNulp
O+UkSWysVbdua3KZ7oDxvAWDPOFZ3DeJuKQINCSp8BOu7+W90LPKDcokIWksSn8t
RRT/qyKrRZyuf9MdeFPWuIxXfgTBo/Cl0FW0NrPpW7W5lSjdBer1VrSpyard6PBb
u8Hah8CjNlzUjIPg6J3VdbrlYZX2fKSyr8qfBf/YkVg8UmCOpD6reVSJ7h1HpD8p
eTKOdRo48M54/E+DKvZDMTcDh8G6zDQ0BLOkFHmErwKugS+zoaM/u3myqAShvB4f
PR+7oNOAh703/2I9Y7+NgTpACme/S5eKBeeun1pmRoKgZg7VU+0Ms0X105yZuYwC
qyoxr41x8zACb246MlcDED94+M65EPJNMsOA8+87bH2yiHrsBQLE1rky+roQBZjZ
OAX27rKwU9+2h6Z65FRIoJzL+AdR/AKd+rX5JdI5GxZS6toIprZXdrXVwrVbCuO+
Abxo2ULZwJnE+8LBXAQTAQoABgUCVSws/QAKCRBJnCsnDF2DLw5XD/9px1JTiyam
quAYNnMzDgp5VpHczcKdY185YO4OWxgUqD8F4q1DT4pO3iGeOXqrWGcbixfDWbLD
FTvDTgc23xHnRIHJTjfUKa9UZ6gPrpqceQJTLCUvMACgD2QC/4J7gyQbfSz54/Tc
VaVtBImVbT5adkaJIAH5orhWSAjeW0UxEHxES0W+dHXmbqHmieUsp+EeJjlXSQ2P
W29rAOJdpxM3uYnQF5saKrtT+BkdEQUW3yst2whFAo3ib1SEgylGK83OQ/z9fNpF
eEFNu/yGnKOttPcXUSFvcBaogqfB81ffrv/NE1zRARoDpip9XNvK3ZN3HePYegHe
6SWxTLYrdYqvULNa+Ih0gsEIE0abuzUcIwAgTmkPcvZscUKLpRyQqgUVlQ7Rz2cw
dXgq2goaUd0zJHshVyaCZHcjY07eto3pcJaLOl8pvLan8yejpbU/CSLp3kxc+P+x
cKVGgHrN7Y9QD96+t/H8NO7sV7wh6AtibHEUBc51tSryjTaVkrM3Z5ImKsmB1rAk
zKLR6litAtPtZG6KvTqVmyiBRo2+1rCty3hZP54lg+uF5x/JY8S6Epl6zGW3kKkv
42Jhuv1/nC3evyjEtSI+fRHbfjjln8nMf9aSZ2wuAynW6xsExfOGLAb2QTHTleUk
oNxjZBaxruY93EgfCsAqkwr9UHWhS6CuEcLBXAQTAQoABgUCVSwtSwAKCRD33UTk
V91BXgr9D/9oBJR9qUsXBmMsqywyKVy7WEwlJrHdI28mLKGmXxvaNxFpG4y8wkdR
i9vSClEP4GPiMT7WM6nKuX3XZt6q8ldjnFQfCrkxnURnEW89pKMST5y0awsbxFc/
jdq0ykV4dHwmd6FucK/htFvbMH/zvlpH35aFFftQ7ixQ84wAc7C81vlMMmF3vpZz
3l5BmpPs6ZKzQX04C9PjhE4NmmyJTqR6FRIJkgG4l3MEuHeK62yr1sOk2WetbbQI
AJV2h491Fs6IdBsiMGyDItZcU+cc+3lOebrO3pTcDnOHBmMY9UDSkGy9Np3mGmEL
chiNaBNPj6JVAnhbAO5A4lppeQ90yXS+2k3Zd+Wc0B4gY2phMw13x8tiUoeYomIe
mtZYB0CZ/Yy5p6oiuPHn9qiQSsxopJQbfuBiiU6oWCW+UVj/Bn4kw3czFRCV3qRK
9GeH4ti8AvPgXtZ+dT7NO5vSExcJXpFdZZi988V8xcL3+NRrZemDz3wbzu35I8s+
wxJFOugu/C25cTZc+wLeRmVoKE+YthROaGr1Nt1YKiCEkTt+WKVmzNju7qMnNVXt
35cUCC3HFoVq13+aFj2eu05/Hfclr4xHCrAuAjDzRzGYTR6Fnl52lxIhuNf/Xo/9
q+YiH9mVncGIWoO/fy6usQSFP0SCvSPaU9+8V4DjlTdJHxBFmm2k9cJgBBMRAgAg
BQJImFMQAhsjBgsJCAcDAgQVAggDBBYCAwECHgECF4AACgkQPTuzbr/QRF2bfACg
wtpu9p2+AkshjxcrLy6SctvVodsAnResiRA+u8SnIH5D9xJ7GbGv/CODzSJCcnVj
ZSBEdW5jYW4gPGJkdW5jYW5AZWUuZWQuYWMudWs+wmIEExEKACICGyMCHgECF4AF
AlLqaAMGCwkIBwMCBRUKCAIDBRYCAwEAAAoJED07s26/0ERdz9wAoItGScml2mIp
3q272peHwidDq8iaAJ95IuKaf+Gkj/EuE4Cls21qwSOFgsJGBBMRAgAGBQJImFTS
AAoJEMfuohojEXPphnQAoLTQC3U45U9XF2+qI8Z94g9BLjHqAJ43s/L8MmyzO4vZ
iQtEo76hO/eNrMJGBBMRAgAGBQJImHgGAAoJEEVqYtVmAkHStm8Ani8A/JBkcypF
LaBQol9R5gpP2/idAJ9EL1RfGM0bz2YE5P07R1pAq4Y4u8JGBBMRAgAGBQJImHhM
AAoJEEMBh5exXoHPzhYAn2VFJsFGOnNkp8O7D7XKZenzivFZAJ9GYuUKhGMI6lUz
AalcQKl1zfEAi8JGBBARAgAGBQJImaY0AAoJEIOLfJYsE7tYSIwAn1iKoN/OIBJp
U//Q9cIpapuIl9OoAJwL9rdGgwsOBSt5UjpxoEHrF3SrrsJGBBARAgAGBQJIqqAU
AAoJEOUNBNK7C4nH0gsAn3x9pQ8sFFcwwDaZlSl+yfT3pDuWAJ9+WrVKIPFZ2TbL
1CGNAY9JmQopxMJGBBMRAgAGBQJIrsecAAoJEOOkB1OyCHzAh3AAoMs0t7G9Mfzx
g/02NTbNyIFuS5lgAKCKQ+PPlO4JE8jzKGlfKYgB5youtcJGBBIRAgAGBQJK18D7
AAoJEGKLaCVFUAeCGBwAoKc9z1S5Tr5kJ3qD/8rt2ivHsisJAJ0QMWh6cmloJb0z
X0fDmw7g9NVPKMJGBBMRAgAGBQJMTYxbAAoJEGa1RhKilzuBKiwAn3NpUI5tS0Id
AytCROgh+rWT768kAKC29mfb2wBHZzq43O24L6/iMBUrQcLBXAQTAQIABgUCTEgo
rgAKCRDgD8qWrbi9TTPXD/sFAMgQYd8GWYJGu1kOhrTaywJ556e0k2GQgI3XSyF+
FlnwI6YPgmOq4fPMkw7Fn6urlI6FHAoztNgIfouDuQwQ8WjTJykcZJHOqf5ti3Ty
mpqvu8IPFrZFTUEr3yII1BaDNR0iitqyWm21u2UQo65OvlOUwfNJJIpP6tKHOVPA
hm6eXuHuMjpmlfK6A6cVg57nnLQYHc0Uhv1gR4G73yHB1qUjEyQqGrYVmnilyzI8
n3eALYyQaGzJ3KcAYp8EjrgS9iWHydjvN93ONicgvmNRrbySLYs4EjxtLdD0eCSb
5YZ/HOi78shLuyv4HAtyd4o+HOsSsctakM2XVxHseTRixT/1pScciBU4yLW1la7/
VnXmF668wg3JUJ0+fHFyLiXARts4xrgP9DqC9IdBIqMy08164jsrktmw6Ztq1uAc
Xt7jzX1zrdn6ZYa9GQQHNnDSAuFf2cLO3+cEe1CGCG0RBt7JZPbu8/9gkFCut7vZ
CSgiXdvVWijRaWOg4D6LZkRT2BL6Ph1ttyzHp6hr4zX4ZSInFOaXWfsF5dbicVN6
jx7zbaoEZJ6o8BJGfBZqWew5yzh5g+zdSkyKBvX7f2Bxr3kzj/M/ggkerlX0zd7x
rVBLRKtqSV/6/x+VAx45eEu9VOYDzqa5CTZFxlNnHw9fB95sXY0f0z0ZkKmBEIrl
jsLAXAQQAQIABgUCTzxL7AAKCRBSrx9MrAFBvYJQB/4pOPESkU3Oz9E3da3iTyce
AHt7BAdyV8E6MBTZGD5fGQdh9Z78dCWNyYyj45RIJ9v9YUmLIcTsVD2oqkHiFZdI
fqz91TLs9CHt4k7XT1quT6GHYx8/dc+iDKHnvOdBPgrlz4Q1pmoSmwkkZw0BXunK
mqgbsvgHznQng4gocshm7ds8eDzWRY/6n5pgBIdqHFSAiOqQYhO6o73Rnax9iPxB
+3s/ut5FgNbcRoUTyMpVj/hyACrT+I0psZ4mXC8mZq/rv7lS9u3aKjGs1j3pbJBy
g7nn90URNE8hHvq+4Ehc7KPST9BEupHrp4jz9Jj77xM5L25hIIMExB/n7YqLf1vm
wmAEExECACAFAkiYVIMCGyMGCwkIBwMCBBUCCAMEFgIDAQIeAQIXgAAKCRA9O7Nu
v9BEXXsBAJ9OzSVlIqO5Gw896MiLS6ZWsrazAACg2908LrEtyC7Vkz8y0ZpAH8EL
jtHCwFwEEAECAAYFAlLdqrQACgkQtrpGtLSzF2UX3gf9FVQqP5tOi/s2seAxlV0l
S4wuKjoSQzBdFOrPaZKnBjvjlBmtuPpn+eE0CI/9ocpNWjASgWUi1b56vwpj5LV+
0sQPa94fnapX+g2JRdbMK739vcFaI7bpSXnGuW31QpM78J5soOdJfbB2c6/Jg0Zm
ODuDDl9wCtal7U1qagoXKE1qMWDsBhVSwg20t/WL1wnw+dDF+oAJhJ3s9miDTBIj
2yYY78Kw3cQO7Tyk+zo1QcRJ/Qg3enySvhWcnbit7sGAuihW8tNfH3S3+R+SlHp2
wm1b4xmpazV/kjhYpESMw26q3Vsfcv+6DRnwomHctYqh3BDt/UyogRRNTuDdHxT5
QMLBXAQQAQgABgUCVRcwkAAKCRDq/P6/j+uOv/yXD/4l2Yqj0aHhTFdf2YmmaIgd
9AJt9rSw6pE/zCgRuDF1PjOsfpNo4dp7LhlfzpYAw3LtzZ60RLnJUiWJTahBC8QB
zL6doPsIEpwmeOOgh1HKVa0P7eQ6m04Oy/jwT7R/Ncmp3d6AqPIR4D3t/fqKS5Mz
9W0RXM8sVUYeuduUGU6VEbXOYGp9AwYpwemKQTwH1jOFIhJwJmypNZuTtQF7ulQh
T4nVFb6Sh8kFkFl2L1qhdYT8wtlGXxIdg6oGALnsz1Q2LhjuSymCH13tLOZYi/da
HNjDw/LWzafEKgpJmNmzqIAmrUrgQ831ZFiLsH9DoH7klN1ZTyRx36Njb5pgMH5/
NlkEsPlukvv02BvUoZTVReDo4lOnfDO38Y9VPr8j8t/iVHuLh6E7JlbXhTmc+8fi
MLnBWyOcE4J6/3yJ3YjA61CEgeTx/wPupEaBIWkxhCO639B/Vl3vp12zy1gRFinm
nKQ2qLKCpGzBE0V0wtdgEAece7gJIlay0sFpeeIRtYkFoXNuC99u80KiyYvK8/F8
svLuiop1wtMl2Q+Cr6D+vmC4DL0inNOwuk7NKwdzTy88EAUImp5Ia4Zzi807XSgc
ossUVuiWIwFOVjBkyN3WCf1PDnKqT7kyTQcG2cUiDKE/6hbU2swj7EotQ+gYDw6W
d3zZpUoRtc9xPkK9CKeDqcJGBBARAgAGBQJVGVJmAAoJEAcAGcMqWMWAXbQAnj8X
85kU90euwd+nSwcqrlP2KHQ7AJ9KxtdN3fyckU+6FXYa9Lv+3+ENUsLBXAQQAQoA
BgUCVRlg3AAKCRAQYu3IzSp040AzEACTCpcC/Gf9NsSt70/RPfMgMfonly33jDVb
mQPCyHPdZhc2whdq98jLVaorRR7im9GgKPPBD15713XCKvMuQ6X/ALiOcFLm0NI4
10uYBSxO7EnquWtQXetzhnRKKYTXPK/1Q73zdwZvZ898h8dDGn19E660c/eWgvoh
qog63kbQvrArQRByM1YKf03Gqp5UiwqlG0lLl3TQ0G1A5SxSNz887ysjF4zCfNxu
OFrUAo26lB6+M0EI0H3Vmq3cFICR6hY1dJkP497h09c/m0q+DAbwqjnw7O570Z/T
YmjdThDI7B5rg5ebR5iJpW/plwB+iE1MHuVFT6bubhCuKPDQpqm43khe+80Gl259
c4NvnZJP27SZvHI6EKVFh4uri7e642WkOUO+ws3/8cTRJre+F8XkOni/Qwy7+AXq
5cxS56aeE7Lm9sHjjBwMrMUDdzPyhc2zKWLqTDQyRJLZtiXxKLugNmyovqz6lpsm
zuaLTgFDTzLtIP6wLH9b/mjBwZoabF+jKnnqKnin3tGDk4UmSQSd71RiQSc4LWpm
Sw1XWA0Ncqw+vqLJijskGhB1cwxQnW+38mcU/9WNeNlygSGo5rTyLGs8Wd0kL5gO
3DF5vN7241XY2ZD2+bxtRS4yB6+5APvOra22rHRUE+DzfAX1bsbrO4DnecUoQ9BS
2BC9jAn/3MLBXAQTAQoABgUCVSws/QAKCRBJnCsnDF2DLxwHD/4sVcptzCmV++lL
GgK+Pib09fuuqk630kIbawwwN95IXEEVUjLKtNBjFTxVoRCI0ssaOlXWjGEPzubu
9v2QoYsbo+aVealmyOgvKowktM9utgVThO8dca9YkKBnK1i/QHtrD/Y93sijsZeR
roUIQIH8zBjmHujldGoT45tu1+kjOjY/q0PMrSJP3A7ktuNmWcU85qra132WxKYS
p9i1UosiFJ9o6t+JC9px/PPXapRAyWWQYCp6UCwf+DWJEn2g6LyYbSd8TPv3+68c
KK9aqeB3ezluPBJ76TFb6QA0OnpmIHnxftNsLW5uiKP2fYNRifN6xe8gKc43YCMr
rJHuFsvjWeGJK0oLSWnji5gIbYJxrZO5949GMAM9BGmHX5vdJDhfE7ARbncL6dQe
pPFLHmz9cx77/5x71623GX7Wh4zCg1vpHVrLO+KMV5Vq04eQP90ZlgUyzmNxmb0u
ptKyOUSSH71iie3il820POhBRbFkzAoeMo/VQvRjRsmq6BlBKPxaf/vbeXjOkcIt
+mXHdGInwP7C01hjTw08mV6kil4n6gk/34rfirkASi9BgGXtbHRW7YTE1jUDcKiz
sKK69Kwie5FN7tPXarNhocL5q7lKp5GDsbit6fSSxvfxm4NUbmCuZiC+198GbYFd
o2BHOOxkeNCMeVUMBqomVmZJpLKGDMLBXAQTAQoABgUCVSwtSwAKCRD33UTkV91B
XpnCD/9YRFlnd+tBC4miIqCZY7Z3RRy/s3lj45GXzd+PDOyxHME8vUivaOXri73T
jc9gR8l9jBfCPMgOsk9iC7kI53ScCwV268yVcRH6vNxNjKgIsbWmmAANGTKaJWsL
c7Uqj73OwZVQWufLeKCmzciQ2woxfot/DArNf1kjaKKNZp4zqxVpdlBlsPnWtt6X
WfeOzd+g2EtZjKR4lAFc0z5/JKVFgL9QPrsBtPfs091X9uqIVMkV5UxwXxOcL+oQ
avtWmuayJo0eE1VHSQrOBu60Pz0MG6aZ+i5RLPUxLJjVr5I5vACgBUSMVKxLyIUp
xGXuc4+brDzjWD3C31MVuJfYBMN6+adtN4+yb6zolgc3YnOBzASKvfuuFALjjOjZ
2T3Q2mdtyYCFOXdYQeSL9coVsXmHbsWv86fKXTzy8JBdkyxUK9McBKL5zqwBaFIa
whE9Eh2hBy8wllfyMKGoJLTLeLPJcsbXTj1UFrcsJu0NM5DlwaNV//DzElnt7Nb8
gdfsAQn0NKBN350wywEXB8Vr8AilDL3zqxzIJzFyCecr346uvKwAuZTEg+1ClsNt
QlWfpxaOg8HW4Z9K0VJmEYJVoC/iipnRsTo9AFTE5Fy5D70nq48oYtVwqiQpwHZp
S+QnhBcrrX30uSeyZFi8JMbivZ8CFGK0eKTLCL3QEY8cIfjkcc0kQnJ1Y2UgRHVu
Y2FuIDxicnVjZUB0YXJkaXMuZWQuYWMudWs+wmIEExEKACICGyMCHgECF4AFAlLq
aAMGCwkIBwMCBRUKCAIDBRYCAwEAAAoJED07s26/0ERdLYQAniGNjfUFZ5ve4o6B
fNyOaMvpe+qMAJ9DJ0YwBy68GVFNIWKzijhzItZKosJGBBMRAgAGBQJImFTSAAoJ
EMfuohojEXPpzQ4An0yk/lr3f3PeZTm5VZB6h9s6wlNOAKC8UG4hn1Pj7c+Ftiqr
KakI3+f+WcJGBBMRAgAGBQJImHgGAAoJEEVqYtVmAkHSPF8Anjb978Uf9NuA7hUU
tDX9anSIRk9VAKCFEqrWjJX3tiu8xIVYtSPtCMhBW8JGBBMRAgAGBQJImHhMAAoJ
EEMBh5exXoHP390An3aggy/1nSCSDYe41KIm+rLNQRLKAJ9ILYScdKimEs0Ha0zj
lLBiwgQDBsJGBBARAgAGBQJImaY0AAoJEIOLfJYsE7tYG8sAnim6EjRurkKU3eOl
omr/r9sxvASHAKCU3DVWuGDE67evEjtWVaZyo6Bcy8JGBBARAgAGBQJIqqAUAAoJ
EOUNBNK7C4nHZbIAn02mGxyhpdLdhMYHB0RyWeMomyOYAKDE0eaJPQGazKliHjF8
0R4kHaTeIMJGBBMRAgAGBQJIrsecAAoJEOOkB1OyCHzAwRYAn3sB+nuUuz9PRr3I
o7AhN5u3oyBIAKCwI6LBefstrVKN+/aKrdHl5pO/gMJGBBIRAgAGBQJK18D7AAoJ
EGKLaCVFUAeCrLQAoKMCUNXmEAAfy/Wxh+SPQ66NS/3iAKDdUMWlgUbr3b2blOPE
MTDpHGDJocJGBBMRAgAGBQJMTYxbAAoJEGa1RhKilzuBKP8AniNJSinhycz2PrsK
XZP0P9niI+caAKCD20SAxhrISuUgBm65QO+GmFsl8sLBXAQTAQIABgUCTEgorgAK
CRDgD8qWrbi9TeiZEACA+74Uwc9354fetOhT208/KlVLAi0YDQLJYgNcO/HElVxF
B4zrOohQm9ix0JEL4tFZ61F3dbiQZM6ZrFd8ZpCQAAVbVsLG6RVJZoppMq50oBYa
bhZKjPvo5zo8Y7yhZrqWlENWKDf6673MIrl9h6JnSFoigawLDDNSZ0uniqW6yryz
0sffGoifg25u2HgmUHZ265FQA3wwBzcr8fdRqMNFVO4jhQ3BK99FpVIg1Ybq9A2L
XsNBbpbwsHk0kU+qawwEnBvs84HaQxIbCW8E65QAFJ0T3suCcvaMxtUDEDrVi5dS
tkOIcijRgFRlQfRZHoNx2m7FjgSePoOj4IqRVYAe27VmC92mgcVY/mNoTIsFW4ci
UWpO6NUljJp5b8e0xfHn//P37PKb09pqv8nVsjYMCYWN8J2yvjyXIVXytn7sRTO5
A7E0G3ENoDAzp/g+NYzrkcOYao4J3lbVytpE7OzMmlUCkZMXxb30X14lpwtsugi+
M3Ylo7iB7/n54AjTIvWAOGUbZszeJ03LtUmd38Q+7IGj5jB5WhZWPHwlOrf1ZySq
pNNZ88xQwi74H8jGKA0/y9VqTuiCp5D2jRdGHKdG7C1FHTNg5WlR3YAkrK38i92l
a8zZn1+io/k4SCfjc/mGVi7KKb2lDeJO/hPGWnNDRtU/fNgUfzLi3LsQZ6eNjsLA
XAQQAQIABgUCTzxL7AAKCRBSrx9MrAFBvcMpCACK78QO4Pc9QdNPluWBHyVV1IFE
WmF/u5IGhOVFi2PFnvI7cDOExXP5eyQQ+MJJOqSuKAQfNJW8BhtWv8xp35ATP7wA
NRjHUf7aej1MmigcBli+srv1DsTnKjXWYr+MBMz7vb11hHguuzIuEhN2IuRSDfDw
7bZ3aJngut2WSz2KCY0arGimQsDK7XXm0O/2OeqGOSR23LnZzVSOi9/g6AcRqPfS
rzNb75vNbBF70koFw0A30IOj9C00uhUrK3huTU8B2E9DXB9jkLXPSvi7bph+31Ea
Tt50dkurQ3bkArNh+WmrCCyi3lu8hnay/NL/tAC/P5DENIl47jgE9W+rlZ/fwmAE
ExECACAFAkiYVHkCGyMGCwkIBwMCBBUCCAMEFgIDAQIeAQIXgAAKCRA9O7Nuv9BE
XQfbAJ0f4wKtUk9U/W13hJP7kiUIvPp0jQCgqOrajmpRs64PEH0B6khNrUluv3PC
wFwEEAECAAYFAlLdqrQACgkQtrpGtLSzF2WZcggAxLDIJxliqBExQU8uVsQLxhQ+
EyAErwHozbN4EUs/1futHLLg3M2aPdxI9kAlsuYsCWLHGWpEI+1E+EC9y8AoFVxb
IHrh9adqvuYygA76qpVYu3MyR+slpd5D3UMnJG5t7+K4oqCJ9R1ZdrGY/Gci+FuE
GumxKLojrZuX960H++3g3XZMcSd0ClMynnpRNygyYZYz4FcpqwTTGPHINjd6Y36Y
U8DGdmdviQhM+X92R+Cn0T029l701l0IR54cVrhvKQfOU7SVbODKU4bGilXKyq0J
bOIgQeqNWiGf5NAGL+w7yJd2jj3Y6ErwGlDjxJ+xlJhIyTMpcaWjlKXiZINgSsLB
XAQQAQgABgUCVRcwkAAKCRDq/P6/j+uOv5vJD/9y7BDvoBtRLm+CnVvcikLpGIbI
pQ8azC8/CejSDg05JkX1A0tL6iIqeeCRFw1VEqEfdJkzJjYcjbCR+GJ9twM27RuP
NDLw3ZFq27lawL5yHUAHy6LSlobtPikGSEQ6+8y2npLc70udjsgsYY24beimxVs5
8AFXU9Wj5F0D4Go3hzSLCqkrLwbNi45pXW39aUhGwUxk7QWyfguilD8vfejEUuE6
7Qqw8iWbVbiosw1qhUtBj37E68vBZBB3eUCPHHxn9UUoqhxPpia5n8x6wjElds8o
GG9xs+Q+RgaxZGcotc3rSFyl6sdMLb43ZPKVJuVmLJKned6f2DKMubi6+5Gu5Ps8
j/XpxzPCGCu17BDOcLqjL8gH6lTdzWqrN70k5zTFmJ9YFT3pI+pk8z0i80LHLXq8
3ZQwSIShU6Wm7KkaP4j+YU7QeNGteDvHJqU15nWsmQcIweegdGUbbfaOhbJCvntG
w23AJHXN6Sf9u3MIWd/RBkdnUpyTUHE4Ax2ZbxI5QfTV+1FmDRazUZiXwRhvVLfF
iOyNFQjAIYu697vjo8P/44EOu8+zvGRaeq09YOQvbaUPg/Xap4z4K7JIUwN/TZ0I
wTNemGnOVB59IHOf78b+iWe3EHM7CyRqArhNuooaiP1h7mlAB22q1313+mDp97R3
NaxlzJqu3T9K2WDxvsJGBBARAgAGBQJVGVJmAAoJEAcAGcMqWMWAIkQAn3hoJ5pP
FXb1PZJCoiV7ihWsivvKAJ9nqaa1mqvDVthcUYjkwtykpZCL88LBXAQQAQoABgUC
VRlg3QAKCRAQYu3IzSp04zGBD/4gvtVS6OfOLrIeA3tqZlXm+fZVs4p+eIPiS/PM
Rj6OL8OBy3+qls2gLHXTd5UWinPkvYfsAwgH31ZJLose1IXGReEP0N3gs6sKQCUa
SWMNaEYPDuok1F4vvP75GKf9Oh9xbSKyrgaFxtEJ75AHI0njShLGL8JmEmbzQXr7
DLLOnGWuAfB6zIqMH5gU8bGLGm03bTHErqOq+LjJ78RFYto0Lg45IA1Mky47xfLi
kFZRVlLwiFf4AwbK6RTBPkh0u1AkM2j6ogkiwbwE1/ZymtMXwlUURbuJslO5OSqc
TtDlAHzbG8sc8IVwNjmktA6/WcCWLqPbyy2MCZNBtj1zl0KGVvLt0u4lLIMepECn
cIRFo9KRpj+ednFH/JoqthPJRIpryVKCggIlkSZPUamDXMm4sc57J6q5n7RtP8tU
tikBVQ/mRAvsNtjZlg0NkCTUn6VUBOha4IicR3NxZ38meH8tw1Mk3T7Xki0GA41f
iU1JQwh7xYHpaozkTWL4sJE5RRkr3hxyJOKJXoHKsFcMSSGbzzG1MCYxTifTBIER
uGNHHTciV4ModcBDcubECAD1oX9SHYqz4D3c9mBHd+y3+P7b5QnP899KElnLkPFB
AIXvvpU6YQhHjUkZelBZuHSYWGmc/N3pq9qpV4lVDXxuhZ8xGhSpzvidnnErr0em
+BHA/8LBXAQTAQoABgUCVSws/QAKCRBJnCsnDF2DL1HAD/4xurkiGKAUB9sgqBCG
SNE7Bz3LcC+Y7Q7CJLVUAA0f8/ddaEAngwItp9YDMjwWs2nAUaboO0OI/ZaM3m7n
2dpxcDjVo3AlODZKsIEBcnIbgHsC9TrpFCQP2CcFi6Yaq9xbnJQsIuS/uFpSgUYr
usIxxoprQY7oTgi6yXrMDjbcVRfKyqOmOBfGxfEuZy1jOZwAinMwEzmXaGs7EX/z
R/thgZ9Q3R7YpDMDmBjBIeJw4E+6xiTCP1CDez6W6iZvG/jEQARCeBPvbDuJwAkU
eU+LNbw3TUl27qWViliJa8Rv7bTx+FIOWAcpKzKkNdc75XH9QrFsTCHtnnZa07mp
jOeJmGAOMIwDXFrwwivMxEmd8rg2I95FyQsQLK95rjjzJLc8o4uFpn7/yelniKkz
4Io1va5pt6033N4b+8rMD9sOFxTnVz0QIQ/7FBYK4F0m8IvP085NCde9sGjSV8+r
pRX9CcpDw5hYfSxYFOcXhqZoE/s5ud4cJmoO//KfZ0VOMuZgMKDaeD5P1Kkl5TNc
uZQ0Vv2ZK6DwhKinG1DShZImS2eenwInV7aJFsIeBAC68YDS/eg6dFT1K1dfv9SH
FaWVplfzi+VJjduB/ebsPWPc/KBSCEQJW8HA6DIV+aVnnyXqRYfaNbKcv6Spfqtg
2Cc0JzUNur6Qi/+IQH6u0f1gRcLBXAQTAQoABgUCVSwtSwAKCRD33UTkV91BXjNA
D/9sJi9QJcJa+hmqK0TGYfYRSxLeMQTkwVAJFxEB3F8Uz4fjk/ZDmanmp+ai4dNu
h2K/EKmNnEAiCI2iT4JFsmw7bYZ0Uvl30ubDYewbQD5QWxqUA9R3fXKWt68hFML5
pF3NSQ303sWOwlZkNiqapfSTURTZet/M89KhcsYHSXnFvdV+tJYiD0TZM8H9NHPh
14HnzqnjIkjcJqPKRC4alBYidPjh+JU/YFZgErA6t6gzkfQX39P4YTkC9scsMOe8
7ijM8r/IlPcxbDunjfz6+q+CGGTlAVC8DBIvq0UfmFnO3HPLBABR/BDHIajKEqKh
yiOYpiJtDlkMgpj9C3KdffpRBNDVUjdNaOqFepEW00Mx4TcerUSZceEi93EySc3j
y5mUp521WQ4sJfSbmMfUwDHDYpGKywpQGpteStzXi/3kgZ9oowLaq5SHC7M2rDbW
6N530l1qSJgG2SWs79439U1UoHv08akBubXgf0ojBACN2bQSZYgr/8yano6rQ6sB
4ALxy4aCeY384MRPPypSSo8CGDR/yL8vYlGc/odBoXuZVatUvwOgVwD14smnDTLE
8MvJyFXVXQIQ2iwxBo79iulVaSkLhAF3Stc3HSGcUTZ2SjNIJWhuWDYI7hPqOaZr
+goQN5yo+Y/G2WnV9mgCSPJM+D2Wx8oUm6WJWTYWDxmpLs0hQnJ1Y2UgRHVuY2Fu
IDxid2R1bmNhbkBnbWFpbC5jb20+wmIEExEKACICGyMCHgECF4AFAlLqaAMGCwkI
BwMCBRUKCAIDBRYCAwEAAAoJED07s26/0ERdKh4AoOEX/awmWPf+oSw+eiVXqvf2
3rP2AJ9b3XURzvXvDnrws8LOeuiZZsM/38JGBBMRAgAGBQJImFTSAAoJEMfuohoj
EXPptMIAn3Qoe4rQXeojVQp9DnUgvRyWZuOzAJ9+p1TuPWbY2FQFkfSkdvOlM6QH
rcJGBBMRAgAGBQJImHgGAAoJEEVqYtVmAkHSEx0AoNkiDngaL1C296UiqHe4xo90
9OQBAKDZ+dQz/QCTErqATxeaFwE5/PYb28JGBBMRAgAGBQJImHhMAAoJEEMBh5ex
XoHPXkEAnRJlucpv6DrJzsCFsQIvQAadAmKgAJ9JkhegZk9Us0mpu+mE9VweF33H
gcJGBBARAgAGBQJImaY0AAoJEIOLfJYsE7tYnykAn03yJnVk9TOJ09X+RI3+CJ2t
7JJJAKCEZveipBmui6hO9RBR56y1TW/90cJGBBARAgAGBQJIqqAUAAoJEOUNBNK7
C4nHYWcAnimO2s29TNHiK2ZbJTmzpP4HbZP6AKC5WT+wF8M6304/KByPmzEl+2ch
F8JGBBMRAgAGBQJIrsecAAoJEOOkB1OyCHzATPQAnRl+6co0HPtkY0N/Xzs2DwtE
B+j5AKC+susd9JbkYy8M8TqpvS1kJoaw2MJGBBIRAgAGBQJK18D7AAoJEGKLaCVF
UAeC/8cAoNSszOCFWOZl67UEWBguwNdh4R6GAJ4hGfQjXvPqFWMGZg3At1KS8T5J
GsJGBBMRAgAGBQJMTYxbAAoJEGa1RhKilzuBvvwAn0TzvbHvd0WP30T8bjtMpx12
Cg6nAJ9nhAIu7MZo4IpbbkuzpQy554Zgf8LBXAQTAQIABgUCTEgorgAKCRDgD8qW
rbi9TdX+EACfHXa4kNsZ0y1h5/r3vi62DGFwLdJLy0eG72Cqzs5nb7gCXrO3WswR
WgC1eVGbw3WMuIMTBpehlpOOPPN3N17+wR6brbAQ5PAyZD78XDChEsw0C6ZL5v5B
ut754oMXx+vyQrR2p4lHQBK8f+JayWSDmCQh9TM/9aBaKLuT1sXRSvs5ygEeZYE9
+Vlf/yoKiiDatq25QwJbLbp1iALttodQNLfrw28c6ZPDcTAHHn8NvOhs2Xz8NZc6
BI4AEPvZ6SwV0eErifWzDzSYWtBpFYXt0P7qWCfjGuvJIdskjscaeE+J+K7C6tXQ
2L2JE/hPyOUewA31Kv8ckGTzb8hjpTU5gmb/o8ZuKO3A3OO46Vqg8PzjgXM2jNQK
2zEL9HD/cWuH5XLUQTBFDur1Hq0LTm5rqobmKKrpTB6wvZgM7qzct8qkPFe3iJY2
0TkOICcl3sOePocarNW/mNNdXxTZHkqKFlXIvTMXeDh32ME4CiTnKK9d/WiK7vUK
WFOOrG9Yru15q3NX00GL3c8Yx92Z1IetpxuBJEWe7r+DqnlLmIG0MMfMRGDN5TW1
4h2SGPSKqQM8lsgUWQrWxDL5AGarfNAfSck0FDnhlX/2S/QkuSg8bzHcGnlsIyaN
MCzlRdPDGhnRBGv6RXtFS00TfdBL3/rz2W5vlIY3kCBaNw8fETXHZcLAXAQQAQIA
BgUCTzxL7AAKCRBSrx9MrAFBvX8GB/4pqhgWupZQ0OXk3Q1jedbEKuon2XGAHdhp
26i3lTAfnuZtiNm7mzpCBIp2fyMn2kZHNR1MhQqMadSlJbsXvdTElEjaEldEVW3B
kiHWEYPycAUnXXJBCG2cdGJxXYxup4HL9Y89VgQcVQwK4AZUfrzTAOS9tFQYMpw0
THSXtOVEJ0oU+rCeadcrwWBS6PAerySTO3OrEXY/61KK/aDhoDF2VRA3se4cY1nb
aGFZTZfHBYShwyvIj1tu8/KdWXMSDT59oDPaqZHNZ2ADK4EHFVJW3cqQ8evBULo6
fRVkUCXm/E5Utmt3BkfM9cjzvIzlo2C2VeH4QMTnvkdnUE7UIZCYwkYEEBECAAYF
AkiqoBAACgkQ5Q0E0rsLicf4wgCfY6LinNxqv4G2lCowc5m+sJVXz+0Ani+h+GEL
XLIOgnTgSezYyrmAXrZGwmAEExECACAFAkiYVGoCGyMGCwkIBwMCBBUCCAMEFgID
AQIeAQIXgAAKCRA9O7Nuv9BEXUpSAJ9kc9Xu/YYJgkSIlN8bGqaH6m3TUwCeOnYY
zIXm/Gv67lBVpVaaYoUpptnCwFwEEAECAAYFAlLdqrQACgkQtrpGtLSzF2Ux+ggA
g1cO07hgAeQAsMyUjUEicyKuXNvJu0DXn15IhWzcoZRc0H+8bEX2fkkuvoGtfVj6
etSd78TkjsuyXk3VFJHj78z6e0XYWufNm88mOMtMSDCqavhJklEJ2araDdJ7eGoQ
ePmITs3/GKAKrPZQJvPBDomf3irq1WNEoZKHWrXnEMWvGdKQiaFtl9r6BrCf6Gcl
qhCJ48h/EGadV5usGociXTOewzNLUwE19klaKznbexHX363lHwDIcCXkzp8nMmKS
asHTr0VVnh7Uz45+P5mTLXeiSKtE1K3/NV8+ToNWi4am0C6tmUzGENIR/Ix5Fn6X
wKuM9uAVzOISRSjTxyeQPcLBXAQQAQgABgUCVRcwkAAKCRDq/P6/j+uOv0t9D/sF
NXlISWhVVTxL/xFLr+KVvk0Zs5efFrr8grKHnHW6pRMpgYMqE4llHWCg4AzbrdbT
mFIi1cscVsz6gJ4Br44c3wVZBREgWIyPHhSTTqMbrggD2WEeCGnMMr7YnYr+nKq4
IfoWhqv0QBAA4wxjbv6qIoVvWG3plB6YbkuYanmsVaU3FnGIUtm8mU8SHKxWQEns
ao3nvM5AQVB8+jHoNFE68MYnA8jnqZKtoOR1qb1LcviS9WIdj3HsGCiFkOxXYTzr
9kwAPmV/reDRn/iQgxfLieflrWtf4nGOpKAAaIIZs7UaxmDAltwP2mg+85tTb0gE
TwLHiMO/0SvT5+POlPxUMk+fFWFBOYQbzMhPrI1ilovShLnAdRG3DXUniafY2KKc
iK1pi2Z3DqnHaZx0FtnUsZvUkXG6EXvjOVs0KCTUuPQVUDIOdPub+0dZMPTo5moC
twVR9qeNzmhaPeKzBT8KJeglihLI/pBt0SPYWbWaW3EOZfCTdL583oL/TnJw34YR
pYxVic98CpvawyDckdVeNPLOpzAsIQ1Z/4MEmD6m5v/XxoKJQYmxMmU7o2xPh9th
lECgXKRr5z9/iGadQ8uemrmwNqTstEN5ID/QmRRk/VlDQgzwXERqHL6klIFCl1Sc
oiMFbxS2SgEurGx2RCzhHfpYrR9DluaxcrdQ3euBaMJGBBARAgAGBQJVGVJmAAoJ
EAcAGcMqWMWAgn8An0O0ogMpF9mUQJykVZOnCWjxG9RWAJ97js72VsZ8TkrEPghi
FZdLOZR9GMLBXAQQAQoABgUCVRlg3AAKCRAQYu3IzSp04+TMEAC4UpOTOHZF87lR
QHFF6xguM1D5HieO8xDmgliZUqYMsThm+PuV/2gIHHf8WtsqeghH1Z6QmvIKI51/
wN98QemRKib00EOW+OVxdApiEElHJtFnzS7h5bzp1jwHC2EShXqL7qa65m5Du0oE
tC+6xowT7o7W+I0TCXtlMGboz83kHLWxV+mU4ite1IyBZuhGmm9h0WUveJZ8KZAQ
nLtKql8ibeK0+i/zeghPrU27IvMgQKvAiYpJglmyUKIMYPojDzqoWv6gTtHvSMG/
gYTPudqOlseJjOwBi1wVT+uDrlbH+tvr/E68H+umdqo37ThhJDmAFBCUnU4T2amn
Wi1vh6t79lTFoWPAGsZC5eeOsRotLPHLzUu0KKka4y/HpWCk6gU3KHf0kSIQIzqQ
Hk+WlvkoJNxt9gs7CwS5s8mUeWdGPbIisqf/slxP2zwgAHk67hK4p01ohjNGFP/s
Qry/EgouAqnnOdFHQmX3QbKkc5diLLG4pwwju8Bv+iIjNE7MYZYzFaLMbgaVhucO
bHubhopQ9Cs9A/qf79I+hAZ5piVf3ENMzWvCCkzjZQo1lVqx8Jzawfkw1vuFw4CD
lRthA+itmILTG/rSRLbfMD0pAc582bB4GXqhKwHxbrw2tim/ubPGvaLu5PW7q0C6
SHNctWHCNLdHBg4h2yzx2PuUgLJJB8LBXAQTAQoABgUCVSws/QAKCRBJnCsnDF2D
L6uMD/97Zvo1c31liHKfi4NGYRbcz0O3ITPGrlQHsuNyE3gD1aa2L6xhqygDpvys
esrFxq8J2XmFCK5TmxcmavlBFTWM8EnF5iCgPT/DMm62rkF1KCnsP7Qrv9AnhLLj
5gIjQmAeGThWKJCG8L8S3pXAggdTePHOHMwhopDNvv+JG2In6sbmB9JRmF6guYvP
5JWwegvjoxDI0IeZhPMw5b+j8r3MC152qixdVPPd1aZ7xzz+ZCVfpUBsFoQ22Zf2
00qltSI6e5uWnlueysBxBRk6UxZvuxtoWxhqS8WuP2zcvxWv/4kgwlSaoS5f+mt7
Uim6J7pfTHVEvi4dfzfjf/M2bk8W7mn+01rs2WyK9OyvRQ9cGrdXKi7t5FfjHbeh
cKuEB2oLQdXHzMSU7KzMG7agk+8QJKA1CiPM9zUwl47/Mu4STNBY7Lin16HHzC/e
pjWXp9SlIvwtMufMI3hUxjHc1RZtA7V7QxCTd7EOwxfb+wjPMim+JNc9lnAkEp7L
3WDIXzNWRx1amijXW+9z87u2yImzSzDLPj6ecaZTanPoO/XLTwN8ln1RGh5prvWU
THr3MlLfIh2re5OeA+Nvhd0mHI0ga0NuY6dIKGRDXGP/9v3LpMFsrkUw4C6Iv+hQ
uqjo3OfiTqeRy1voohZV+7SKVM9qvqnXaTZCZmD7qjJFQeCDp8LBXAQTAQoABgUC
VSwtSwAKCRD33UTkV91BXuNmEACXiSD1Ze+XpC7JhUHfa1vQMCzDKSWTcYm+Q91W
BTO8jrDaeFYsQbB2nKJbBNc2Wn0gWAUwJ1qamZFUEhGpme1pwAk2gvp0VvqN3cJ1
A1q4y+PGIQllK/S7ihG+wuBed1CCqYcegIiIHxWYDzpTlGff/Zu2DaX8CIBVJmzj
s3YBqbH93bPJczyMdBp3RDBe7vne1cGjP13D1Z4AriFXL9VSSHod38gkJiyToUqH
EiShqPaOE1FF7jvSBb/ne42mcAMlTMbztzpS819UQbw1D+fKsOU9C2+N/OlCe2Kq
xCj5l9gNGwHbL2LWcgSTaNSRXMlG04UFgwj9xI7XZd0KpBVtYmIHkXiNruAXUKIU
95s7hUVqNFlKjGqXXsYruj/4hKJDbsrGVbf4WldNAcKqDK4z+zIclV2xgNw1BPzj
QaTaLWEsEToV1XNr0FRXGHVZ7iz46GyTKnUobkv29fOdWofxHyXYSFf7+L1imIYY
/eEYjxxVTMhRag6AMo6Xtt+Dageh6vfipvmTEbmv91PC7+SdCUf+Xpv8ZsQyEBmP
QNQ3geemn9UU7WclWAVWfG7Btl8axNNFaRDdZ7hbQRnKG4DSrUC7kGRyuxWhDWv3
xCQ1eimRLtD5jUKbZt9dCwt4c71299YpP6AYp1jHeVBrICosSIFjjsVjHxP0rcZH
lWRgSM0kQnJ1Y2UgRHVuY2FuIDxicnVjZUBnbGlkZXJwaWxvdC5uZXQ+wmIEExEK
ACICGyMCHgECF4AFAlLqaAMGCwkIBwMCBRUKCAIDBRYCAwEAAAoJED07s26/0ERd
STAAoKzPJPZu0wfK9rp+J2k4ZquJnbhSAJ9M3DeCS/Z8UwxuQbgQjEGkU5EvGMJG
BBMRAgAGBQJImFTSAAoJEMfuohojEXPppbsAniDH/u5DnwoIdlWZHPGQusLOA+eQ
AKC4NVdbHKr2qOXFyy8ti53bc2jDS8JGBBMRAgAGBQJImHgGAAoJEEVqYtVmAkHS
q3gAn3RBp2ZqsrE7olSNQz2W967OJIe4AJ4ma/fxiBrb+ZeXAyC//yxDmS40QMJG
BBMRAgAGBQJImHhMAAoJEEMBh5exXoHPuOgAni8iFVnPGF9nD7qa0YZa6ON9znIt
AJ9aP6ZgdFq93EVXv+oALJFgaGLCc8JGBBARAgAGBQJImaY0AAoJEIOLfJYsE7tY
snwAoIts65xFic+ZdifddFx5TTWImm/bAKCkpvfebJo6EoxQq+tyCJVP6hXHFcJG
BBARAgAGBQJIqqAUAAoJEOUNBNK7C4nHTyQAnjvCk7l3iJs587Au3A3XrWwWBHmh
AJ4qsH1TJKPKK+bMI5E9EWzXRETtkMJGBBMRAgAGBQJIrsecAAoJEOOkB1OyCHzA
LMcAnizeDnMfx/nb0E6K6Wj9Y1er30TBAJ4+YHMYbBO7vrGeVU7+2Oc/78g5qMJG
BBIRAgAGBQJK18D7AAoJEGKLaCVFUAeCHHcAn0C+cLm9yl3wJKgltbd9WViE4Z3A
AKCvqGRVhQEEVC0MqX6Vh4vFeTR5AsJGBBMRAgAGBQJMTYxbAAoJEGa1RhKilzuB
dhwAoIffxj6FO+htD5n/wSJJbEgHQeioAJwMzDtLLF6/S4t+Xyumugbivw1jKsLB
XAQTAQIABgUCTEgorgAKCRDgD8qWrbi9TfOlEACjA0j6N4Ym6Lh/9gu63bVD8nUH
bSBBLoPP6WrbVn7pBMBLpc2x2fXt6Tlc7ealVjYn6Mj4Z0hkXL3/8QRI+ihJHxaC
UQvX2Z/heaZjJbc/t/vsuGV89kfFXofiVVnnShiszg9PwHmN7eKFTr4cRNZy96eD
hsWHwyklPpLY51aBuYAKNeYWl9FKIjKsHRI2s24r/cekf3IqnDAjgEkwjFFtAo49
rpUf9aibq94DWczc6pJVFQa4nhNsQ/QdEJDviyLuBBuWcEJzQjWocuqCT4qQ+DER
pMMZz9kFgF97nGdD8G0JbxlQT5ozoQ7h01nNT83zfk85jAnPffRYVeCbvwNR+ezY
waXJMzt8pbqkmjjkIIGaJvT/q3PL7Xd903EUw3EXWyZ+67hMmevJZ+rIBbZTc+UJ
Mv94hDvdnUdFI8VJAlvrEqXqfHFt7z8DSfDNHOa+FNwlnK5Xal0k/EknjhajMyCV
qLnRNIlkwhDtVcNmjt/Hc42FDgczVsVmyfxRBTIlM8Flj861ujKGio5uvQu9cntW
zelB7L2t/sr0RVT84QN2YYaIqRaYqu1o7T2CduTlvoO1+SrlR16yQvtDbOUT4UnZ
L8t+LwQO072PzcnisGgctxHUvABmmmTW+J8B4lMXr5YD28m8EenXWMFOm6ef9sXE
CeNDzgOqxzZ1EI7sIsLAXAQQAQIABgUCTzxL7AAKCRBSrx9MrAFBvXPeB/9TfrIW
saM6JwwqnSwgtQFV/O3beTSXFrhhLYfm76Y5p0MhdrxI5dTFZoiAP4Xe8kVan5T1
UybSIJrskvzcqAdWYhM70824riQ+ZhrFYVyfiTj9WLn80VBp/Wxa4+/sbPpRmypC
87woG9TVIzEk6keIt9wbY/w8F8PSC+X8Kp0FpGITeMd03Qo8kzRwry81txy+fHIG
Numi+VLhIIMeyrOljkzfyJbSvEOdcfI/609yJ8fGaiT529Vddz5kJMew0GUSVLhS
1DlUmEQmlZezhqCmAr0xzIZlKfNmwWwF9Lb+PRANiRed8Nz3IOWiwZYbqyif+Dz5
pzgi75cwDuRaZ2HbwmAEExECACAFAkiYVFQCGyMGCwkIBwMCBBUCCAMEFgIDAQIe
AQIXgAAKCRA9O7Nuv9BEXXETAKCnanbLVCmkatswOHfEijNrMRDtjwCbBm/O7D8P
wbGooyklxyppFIM2533CwFwEEAECAAYFAlLdqrQACgkQtrpGtLSzF2U99QgAmJnk
isKHoAVhY8IQG9EygSyjLqYBmMJ18TiV/SvFj2A1JmlrL3qPSoViZDZY3mjvi6aB
fhFFSa4SbfK5a8jKEU/efkpCjEhypGrw7c+3P93iDBNIMZKtIuak/7OeAdG+sTgm
MufBY+GI+s+YLwcjIp/diYQUMPsPDe8zGBwqh3UYGueyQ8TWLYdeCGQhM61NecsH
/Ot5gxR6PiIKICOEL5YzjJAhm+Y8TDO8crnhrpEec+vog31TTLiOvyVzn8tBzb6/
Dn7MT6T07xGOinua3ju4pa3/EpFQJUKXPeoF5JzVpavKvIJWbC5b2kn+x4PI1fWU
ZbkAqOu4dRblW1ro9MJGBBARAgAGBQJVGVJmAAoJEAcAGcMqWMWAYuoAoIF+6Pk/
hqtuS9d66wnvd0EIfO/oAJ9TGc7OsHogm5UlIGB3tbApAqKmvMLBXAQQAQoABgUC
VRlg3AAKCRAQYu3IzSp040M9D/9+qjbRAutaAAtSOBbjKePxGXUH3i0IADCYmEhI
vkvIuohxLjlXf+Du90BpbL5IPZDhLkRhAF/9cBy/2PtFHEVHBlCwe0mXxH8P773+
9Tw2DHiXGYXmTBgEcTgRu4OAgpdfY0CmPYT29VZiHIJB/N3s7dk5PDRwgZfbrYOM
3JpjOS39d0d5+Y2ZwuZtFlboKfLnf+mvzs5DxKzQetnjY0LzncWgc/MsC7qazfxR
FYvWTKTQkUG+RsAMAlhVd2Iz7PdbgomH8JjOJDbl+oSD99VMar2EujGr/F8yR+ls
jmyWEAJ6/K/bNmcwB5G4n5hkm1e50EB4WhnGZVM94UyXH7UmAYkUBCdStzgnzFd/
D0s11abtX2ly6yV9qz9uLhH7TuQvZVCRQQllqnqkxvNvDHpST/WenZtCHlLGC2SG
XyG0PFmfApto+9f22rgW5kRy/DWSn7vuU6O4RzpoUX6tgzW/ZwDgkXdpOM4pbkqq
JxWTaQC78F+CR+sI9N1/FxGfkxG/B9wrTolnMpzKmHB8MnJ+QqRxYUGY3CKnitbW
4By9tKj7nmgT5IdGW7EJhRUi7S93VBHSfMOSkCBr5TbW/DQCM4XCdPpH1z0kHIOU
R+rZYZiVJdSwjaUumiNjZpDhAB5BmZkIAl+dlvNwKReLeEiudSdoBmrm6PnLKsLc
H1F9HM7DTQRImFMQEBAAq3tt7USB9FSx8uZCD5nA9/10voE8sVgPacDUTyu9NkEs
KJrD1WEGX1n7ID9hAubSBxLq3yIG2OoweWPzQ5QjqDTvfvZVaIdeFO3oQix7PE26
Y7EFyuAdnP2JrZU9W/mnNm4L9jJ7htwJR9dgWtiJIHI4WLyQjxZL8bqdpTtS9ecV
vhrHMdu+Cn7gLw2YdOafK26YEBeWWjz/DCSfO5L/bERjTNGa6jM8hhqTFTIXc710
N3buiMP73BK3wnYGQ3OpyhjpJjfWuroMvkLvHK96NfOofMHBZQJlBlGfNzgr9688
VtyoTVNzRXJxrv1tO7NWEd3kTUenqVso068GTHWd8glTEaFY3GIs+1K/bZT/oMR+
r+5u+urP9L3bS8I9gwnqBr4yswc4dGsCypjU0ZL3KApcPfvm803QXW4HB9zPBf39
cwuXpzmy5gy+VeAYoUaeloGqmZa0NHrPJVG5wEfy/kTOq6scgSSDXvGFZEDRceXv
Y5oEUfkyGu/92rMkrD3tysSzB5KZPcQ7AWRV71n4wjYyHFM7iNkVWf3fziOzbzHt
97u4w8ARLwmy7fDSN5z2oIpdYpUkwA+GAs0ajqtokwUdwFZQCTxyxoR0yVDtqbti
f+DSaS5/5g4X/KzgKA9thvSTvm9EZZaFnFAaaC1CIrEScOmhezCNcTYmqJBl7McA
AwUP/1xcsdDniJ8dRnPdRfZEsqdtDNcOJsaOHsJ0UsQWbAZGjxK07uXcArNcHC+I
BVn6byqmPkzD19T31JWf80+2HeQcj6Up5ffcIZIgTO5fQFU/iipLBJsRTns9l2pO
3V8InVRiFmo4y5GN3M58Gg+/M8FBARXNhdgCUKae/PRFw/+qQkbd9M00PijQtRRO
WznJ9eWMcvFpEaXJB06VtscVUe1NAa0KkDxErgENTHVCgs0ck+AVkuysmZhaRMPm
kL0y8ovkQc4JsUOU61WFJPwSlNBjazJ1A2C2ESzli80qmx1pH8rey/LRM7Y84PNh
xKLe7MPj6/qgwCLzIq+2kvbzisc6no10U+87eri+W3S1JSR/qc5FqLh7BET1Ethg
kSHuxRuPPqt0vsAG15GlcmaDRj/rfFIZ2y6FaSJNJsUOZ7NMZObRSxTD0uGJjf1U
hf5urF9kB7jjsqxpNmMGG7ovPjxLMZMe8nOQD0JHe5BSLk408GzV0tt+fid1RIyZ
wBr6VwHxkapV4f7G0PHerd/fdzi8edAFhk6luMoNOaayQwZ4HQLEdgU5XaCN1ucd
oCL1U1AGyUtuKIPbY1bDvP4CjOM5DIlszsRic998OJPKyFyJEQAhYxkyhlflJJXt
b0QDLMW745wavp5gomSOE+dEAKq5FRCVsfirGlgYZOX+kHRLwkkEGBECAAkFAkiY
UxACGwwACgkQPTuzbr/QRF3ekwCffxReukrBuSLLxMNcceZOOCFHwDkAoK94bbMe
AqW9Zg2huI8TVcEUwXi1
=3Dm1O8
-----END PGP PUBLIC KEY BLOCK-----

--------------uYx1dhFXwMeV9v41zUKQXcr1--

--------------15trd087ZFOgdrW4XNaDLN0N--

--------------a3PCh0FtRIaeRI7FJS65DKAc
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSOm6cYEiufxjdlGyM9O7Nuv9BEXQUCYwd0ywUDAAAAAAAKCRA9O7Nuv9BEXd9Y
AJ4hkquz1Udd6l/m7sADxQ63+w902QCfb2nB9dqc1S51diKWpXXDLWlX+20=
=WFig
-----END PGP SIGNATURE-----

--------------a3PCh0FtRIaeRI7FJS65DKAc--
