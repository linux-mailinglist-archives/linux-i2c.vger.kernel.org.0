Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C24EB41DA70
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Sep 2021 15:02:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349289AbhI3NDr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Sep 2021 09:03:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235235AbhI3NDr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Sep 2021 09:03:47 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89AB1C06176A
        for <linux-i2c@vger.kernel.org>; Thu, 30 Sep 2021 06:02:04 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id g7so21764023edv.1
        for <linux-i2c@vger.kernel.org>; Thu, 30 Sep 2021 06:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:in-reply-to:references:from:date:message-id
         :subject:to;
        bh=s6JcIqZCTgGdRtDicR3/8sc6CiJRxcy6m5GFUV1G2rY=;
        b=g+azc4gQ+gF+HExUYtdmF+StIuKMz8URAULJXbldQxLyTFJarD4Td49Zc0XwC7Ml0w
         SP15UTwok2YDpa2OoBWF5yqUetqyCvAr9TXIP1L8QwoeKsnITWgAe0GEdukU4YsaEC/Q
         oW9dl2ctRM58Br8k9X7bBcTR63ajG8pjcsXdCqa2QcS2Rfp7oXXxd4wDceok8WgFh/Pw
         7Kdq7+vcICW7bai+FRVH5VMXE2bArgfNbducxGuP/EcDFvo1MgA8JI81Hz2fxRtoSRuI
         CideVfBSF59CrAJbrIijAgybbj6caKKt+Bk82QyC9UqWF6uDmQcdrZ8YHp06O7qUmFSu
         8DLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:in-reply-to:references
         :from:date:message-id:subject:to;
        bh=s6JcIqZCTgGdRtDicR3/8sc6CiJRxcy6m5GFUV1G2rY=;
        b=lHlugrEniUxKAuOVil8ERNj+nTrkiaIzdGVn59po6vz7RmWx4TuG7OH3fDAJRKMlEs
         03IiSkiTohSKVJJVmTX/djKkBSINAUxpIDVtq2qOEKnrmvVrN9yxp5HuD3zGUHUTXH/3
         Q2J+UuYm0cEMfipzvqvNIAdM34hvLBbkcTXquRmNAZ+TTbK21Zc6jZBzz8WtjDwN9QbS
         jXjICSsaUgqsqxGqkgGpqDUZwJlgLxavVAkPdIj/scjkbI+w58JAwfxaqKVUUN0rfHKk
         04OYkLJYw9u5awvPFcXo6HI2J49GJWb8hB5RhZBwkxzRy/Ue8x4faP/BFQ2T3N+iuDjK
         agfA==
X-Gm-Message-State: AOAM5316JGtFIS7nbQuYh8M/wTysvNM1qvy0BT2+xMbPRrEyPEMrmhpC
        XuIbxItjI7vFNqz1V3RBkuwgQcpdYH8kEOBHXKo=
X-Google-Smtp-Source: ABdhPJxAYz7Sd+Uzx0qArp5tvHEC4yLfO9BgixZdIaa41qMyFwQkvggz+/gLeora9I2N84nG1UXNJasWjft+A3f1Bfk=
X-Received: by 2002:a50:83c3:: with SMTP id 61mr7014532edi.81.1633006919900;
 Thu, 30 Sep 2021 06:01:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:906:38cc:0:0:0:0 with HTTP; Thu, 30 Sep 2021 06:01:58
 -0700 (PDT)
Reply-To: siphokhumalo00@outlook.com
In-Reply-To: <CAG6rqurDAVKuVc31gOJ+V3AA7GrxBhUjgftBUnJUkK8J6cUxKg@mail.gmail.com>
References: <CAG6rqupTW76a3bYMPc9+rB7+qd9TNXitkLSD5o+xw4_zPZabnw@mail.gmail.com>
 <CAG6rquqO-FCUGBeeuk=LuTHYfpYrF+ownQ0cXwZbE=Ts9s20aw@mail.gmail.com>
 <CAG6rqurCMAJq7WOD5mQ3wgPs0oU41_4C3sd9hXXdwv-PSmgxwQ@mail.gmail.com>
 <CAG6rqursaOKyDu6i03YbQ_xg-PzoEPyPJKJWtrytG+ppO2y=7A@mail.gmail.com>
 <CAG6rqurb9dxft1=6pbxM_Mrq9MJBG31ZufOxK9Fr6yt3tJD-eg@mail.gmail.com>
 <CAG6rqupOCyukEDT4v6C4QiOqu=gdQgXczGx3OW_KCQYvEwJSSA@mail.gmail.com>
 <CAG6rqupFRyTUHy-YPg_BETF7UikObdO6NwoOwrtW9pASYTW0Fw@mail.gmail.com>
 <CAG6rqurFDNeK=P6=R5=w7=V=uYkqUURse+mxSt75TuS5k4Cytg@mail.gmail.com>
 <CAG6rqup7=seCvaNCGSJWRFkM-+gEmOTowG2avVQb8G0txy_sLA@mail.gmail.com>
 <CAG6rqurNE1jJOMVFNhW+Lg3o2Xw9BisXCo+xgaQgsNqFF1ob5Q@mail.gmail.com>
 <CAG6rquqak31LAgxVVEB1U3tWupUmcwHRs3Y3x9BndrYr1DjUcA@mail.gmail.com>
 <CAG6rqup65Acd+OxR1MJaUugLY+Ae-ii_=oUjpQgK0Efx=252CQ@mail.gmail.com>
 <CAG6rqur0vF_FTemYqZOoTT_+wO_p9U=-+1mSxUh_yfjFUAa6TA@mail.gmail.com>
 <CAG6rquotb=uW8D+buMmLO6Dhj9E7P=WnWYh0toXBGZXETR9BiQ@mail.gmail.com>
 <CAG6rquoSBwDhyDXcofqAPqQnt6py=hkLXhcGnZkJ5X9oCzrc3g@mail.gmail.com>
 <CAG6rqupx32p8tRbQ8wpTftw9YCQiX6WKFiWY2OO+sR0aGJBMuA@mail.gmail.com>
 <CAG6rquqZ34=8Y-PCe1bzqOT+BkriC5b+waMof2Un5x5o11_LCA@mail.gmail.com>
 <CAG6rqupi_FPHMuYZbjvX=vvZqCuL5KhcCAF8LJT09K3w168PbA@mail.gmail.com>
 <CAG6rquqRECRiWuTFstu+uhLK9iSpuTs9f28ZUZaHjZ4xsfMOXw@mail.gmail.com>
 <CAG6rqur0Fx_euFV_YVPz+oOHK5e_H39TqA2zbc7EhDW=RjdABQ@mail.gmail.com>
 <CAG6rqupfdUf=7Yr0h1iPgQuhKTu0e=17YJVP1ocvou3B-m4a+w@mail.gmail.com>
 <CAG6rquqU86V-FdG9VXgjjTJhO3BfC-sz2zESXYQXpJLaS8352w@mail.gmail.com>
 <CAG6rqup2i6mWifUmB8vDSoQVXbrR=zOwhbs3ONo7cL9wjpXD4A@mail.gmail.com>
 <CAG6rqupkAg8JSnnHweT1ZvJvNV6jyu1Rfop5_87HHeNzdn_h0Q@mail.gmail.com>
 <CAG6rqur3ApX=Uw=sYVBu4bCRSdUCGrSA+Js8oejp6WPq_FVUwg@mail.gmail.com>
 <CAG6rqupjnzN9u+x-Y81aYZeq9biBZkmHM2=vPwskAEHL2YY1jA@mail.gmail.com>
 <CAG6rquoofxp+94NBNm-uMac06tX9tE_=gc5OTj=owic2brz9-w@mail.gmail.com>
 <CAG6rqurYx3TggTDzXOgQx5N_=ETO9_-tQ9tOaU89kqPLsx6pLQ@mail.gmail.com>
 <CAG6rquoP6XakW3W99CMxOML63_TmJkzWouDR90iwLXxjGMqkLg@mail.gmail.com>
 <CAG6rquoKN0izbvejLoCSf2moZjmUf9TCUCt-ERZS_7qPQ19gXQ@mail.gmail.com> <CAG6rqurDAVKuVc31gOJ+V3AA7GrxBhUjgftBUnJUkK8J6cUxKg@mail.gmail.com>
From:   "Mr. Sipho Khumalo" <mazibukomotshidisi636@gmail.com>
Date:   Thu, 30 Sep 2021 15:01:58 +0200
Message-ID: <CAG6rquro1MLE3Z7LTWycSuT2AMoCSUGLb9Ns-v8Rfx4uDP=rLA@mail.gmail.com>
Subject: Investment
To:     undisclosed-recipients:;
Content-Type: multipart/mixed; boundary="00000000000060825e05cd360ddb"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--00000000000060825e05cd360ddb
Content-Type: text/plain; charset="UTF-8"

Please read the attached file

--00000000000060825e05cd360ddb
Content-Type: application/pdf; name="Project.pdf"
Content-Disposition: attachment; filename="Project.pdf"
Content-Transfer-Encoding: base64
X-Attachment-Id: file0

JVBERi0xLjUKJeLjz9MKMSAwIG9iago8PCAKICAgL1R5cGUgL0NhdGFsb2cKICAgL1BhZ2VzIDIg
MCBSCiAgIC9QYWdlTGF5b3V0IC9PbmVDb2x1bW4KICAgL1BhZ2VNb2RlIC9Vc2VOb25lCj4+CmVu
ZG9iagoyIDAgb2JqCjw8IAogICAvVHlwZSAvUGFnZXMKICAgL0tpZHMgWzMgMCBSIF0KICAgL0Nv
dW50IDEKPj4KZW5kb2JqCjMgMCBvYmoKPDwgCiAgIC9UeXBlIC9QYWdlCiAgIC9QYXJlbnQgMiAw
IFIKICAgL1Jlc291cmNlcyA8PCAKICAgL1Byb2NTZXQgWy9QREYgL1RleHQgXQogICAvRm9udCA8
PCAKICAgL0YxIDYgMCBSCj4+Cj4+CiAgIC9NZWRpYUJveCBbMCAwIDU5NSA4NDJdCiAgIC9Db250
ZW50cyA0IDAgUgo+PgplbmRvYmoKNCAwIG9iago8PCAKICAgL0ZpbHRlciAvRmxhdGVEZWNvZGUK
ICAgL0xlbmd0aCAxMzEzCj4+CnN0cmVhbQp4XqVYS5PTRhC+61foqCmw0MzomVwgFVIVCKkQfEvl
EONd29m1bBa8wN/gFzPdPY8eyVuL5NqSV9L09Lu/7tGH5EPyyzJ59ptMpUqX10mRwt/dJinyruta
fJJpV6RN1eVAsk/+yX4VMrsSOvvPXHdi0WQ/iYXKUrGQRfZOLMpsJ3RDK89g5Y1okXZtHgpzt5B1
tgeSp+LfdPkqeblM3v6YIrKp8zLSJZ3KAmwpq7wsL9ivZV5dIl82eWvl/w5eItdtheyyA/roCO5N
RZd9Mo8q26JDPxo3EuWVdaFsrDd34OZbICIC9L0L0XskQe600TLSRfZVaCfyRDs/Y2yB6hbYO56G
dnWFvIjnCfcAI9IUCFBJUjjw2hEXVE9GrIiGhF8L7TZtIt0/hcxakQE660m/ayHVWCZuIKb0gpuY
4xt6D0mJa6RSD9xdasrGmjUjtoXOO5sbaHuIGkhE47gapl6ULZgjKsmygCheCyXpLTmdhR2jQ7RP
GU9wHNrj4mI29PdgEShjPFQqqj9yJJJyH0KQiSsuwSYSfRu87WXwjRhGY6JyWu1DSr4yXA7BQjKg
73lWLqSkKJ/QTRtu0zshKxfGIHZrrTQEL0yyMfloNGUrMP+Zkm96POuuyBWv1W/ww+waOCt4571N
X2UDAKubh8rOJ/eDBWaIhlhBpt27rSH4TjNfxjtK6bPRhiodJR28PLCgr0nxwOwmSCRmB3qwyRaD
DRcXnDH2xV0wMLj15DWm6rFFOyOUpnloW5osYiTvb1EbhScylbIFjpwxK0xi/FIsOuYEB2rKSFM6
KlvMXttTVUN1Tt6KKoFU33l05msbs1iykHEwsM8ffR1ydkjBcQnKadgBWAshot6lHlzr0FYGwBdS
0mJ7nJfkstVtgF2XALDxeGZZxyBirZsYPMiIWuW1Le6zZeCUYImy5UJtgUSKM2TivZGVxY/i8PEO
Whzp83+gC8CST7VZNW0u68juWX4r27y5YACqdZUXVv4bAbDvOjGDrYV6FLbGwwV5beH6zz021vUj
wdmHNmpnCzYYYFXSIoOnMR85o9HiBjf7nO0LfsQeplJgdcVJAtBgSZ6HgM/mt42c53zdb2aFU0k/
j9P8ZSNB2pscJpU8XDBHUhj9WOEaOlQ4DrX7AD/DzuHdzdpMOey2Z8wf9iVYXwU4ojlkG1C230z1
iVYqL9rIL1xlUmNe45tc8mWhBopMZAABLpqLDkxVp/2B6bWr296hp7GPlb9P5SNf9kFnwzlQr0Ib
AMfdhIiH9hM63qjrx4THAP/wkhIBdR02pxEj0+VVR8nqTmSuutjhGJLdXbkDqyHE88lRPv867HOU
vV9Cv7YJU4JvJoamNO2gqqPwzApv0/nz7Kz9deXPTH/C4BkQzDqvy5YwRm35OfjBOUOzUYqaSYz/
UYdnlHqYV24G92nQE8TCc5C6prPqYOxjcBZGPlraIK/7wIuJPIzONUffAtxhQgeo57KQ5uRgbQZQ
GJAwRc6DMSuYlfIHpln7deuH6T+ErzX6vUHr+VFq2J6htLzH1jzodO9btidieeAmh7LgfYcD9eQv
VqpqI5NmuUSVF41rlSwuGtfKrmHj2vmPGJd+w5iolWzrSK1ZZrXad8W/wAKmth9VGHo/MY+qofum
belGdxXdKNVM1UEVmBdcj1l21J3vznjajD4MYhuS0Tdah2gTRUmtII24uFG4bx79UFUU+O+58EV9
IvxiNJbXqMepGT1OmcO5wSOuNXfy2+Q7Z6rZdAplbmRzdHJlYW0KZW5kb2JqCjUgMCBvYmoKPDwg
CiAgIC9Qcm9kdWNlciA8RkVGRjAwNjQwMDZGMDA1MDAwNDQwMDQ2MDAyMDAwNTYwMDY1MDA3MjAw
MjAwMDM3MDAyRTAwMzMwMDIwMDA0MjAwNzUwMDY5MDA2QzAwNjQwMDIwMDAzNDAwMzAwMDMwMDAy
MDAwMjgwMDU3MDA2OTAwNkUwMDY0MDA2RjAwNzcwMDczMDAyMDAwNTgwMDUwMDAyMDAwNTAwMDcy
MDA2RjAwNjYwMDY1MDA3MzAwNzMwMDY5MDA2RjAwNkUwMDYxMDA2QzAwMjAwMDQ1MDA2NDAwNjkw
MDc0MDA2OTAwNkYwMDZFMDAyMDAwMjAwMDI4MDA1MzAwNTAwMDIwMDAzMjAwMjkwMDIwMDAyRDAw
MjAwMDU2MDA2NTAwNzIwMDczMDA2OTAwNkYwMDZFMDAzQTAwMjAwMDM1MDAyRTAwMzEwMDJFMDAz
MjAwMzYwMDMwMDAzMDAwMjAwMDI4MDA3ODAwMzgwMDM2MDAyOTAwMjk+CiAgIC9DcmVhdGlvbkRh
dGUgKEQ6MjAyMTA5MjgxMzM5MzkrMDInMDAnKQo+PgplbmRvYmoKNiAwIG9iago8PCAKICAgL1R5
cGUgL0ZvbnQKICAgL1N1YnR5cGUgL1RydWVUeXBlCiAgIC9Gb250RGVzY3JpcHRvciA3IDAgUgog
ICAvQmFzZUZvbnQgL1RpbWVzTmV3Um9tYW5QU01UCiAgIC9GaXJzdENoYXIgMAogICAvTGFzdENo
YXIgMjU1CiAgIC9XaWR0aHMgOCAwIFIKICAgL0VuY29kaW5nIC9XaW5BbnNpRW5jb2RpbmcKPj4K
ZW5kb2JqCjcgMCBvYmoKPDwgCiAgIC9UeXBlIC9Gb250RGVzY3JpcHRvcgogICAvRm9udE5hbWUg
L1RpbWVzTmV3Um9tYW5QU01UCiAgIC9Bc2NlbnQgNjkzCiAgIC9DYXBIZWlnaHQgNjkzCiAgIC9E
ZXNjZW50IC0yMTYKICAgL0ZsYWdzIDMyCiAgIC9Gb250QkJveCBbLTU2OCAtMzA3IDIwMDAgMTAw
N10KICAgL0l0YWxpY0FuZ2xlIDAKICAgL1N0ZW1WIDg3CiAgIC9YSGVpZ2h0IDQ1Nwo+PgplbmRv
YmoKOCAwIG9iagpbNzc4IDc3OCA3NzggNzc4IDc3OCA3NzggNzc4IDc3OCA3NzggNzc4IDc3OCA3
NzggNzc4IDc3OCA3NzggNzc4IDc3OCA3NzggNzc4IDc3OCA3NzggNzc4IDc3OCA3NzggNzc4IDc3
OCA3NzggNzc4IDc3OCA3NzggNzc4IDc3OCAyNTAgMzMzIDQwOCA1MDAgNTAwIDgzMyA3NzggMTgw
IDMzMyAzMzMgNTAwIDU2NCAyNTAgMzMzIDI1MCAyNzggNTAwIDUwMCA1MDAgNTAwIDUwMCA1MDAg
NTAwIDUwMCA1MDAgNTAwIDI3OCAyNzggNTY0IDU2NCA1NjQgNDQ0IDkyMSA3MjIgNjY3IDY2NyA3
MjIgNjExIDU1NiA3MjIgNzIyIDMzMyAzODkgNzIyIDYxMSA4ODkgNzIyIDcyMiA1NTYgNzIyIDY2
NyA1NTYgNjExIDcyMiA3MjIgOTQ0IDcyMiA3MjIgNjExIDMzMyAyNzggMzMzIDQ2OSA1MDAgMzMz
IDQ0NCA1MDAgNDQ0IDUwMCA0NDQgMzMzIDUwMCA1MDAgMjc4IDI3OCA1MDAgMjc4IDc3OCA1MDAg
NTAwIDUwMCA1MDAgMzMzIDM4OSAyNzggNTAwIDUwMCA3MjIgNTAwIDUwMCA0NDQgNDgwIDIwMCA0
ODAgNTQxIDM1MCA1MDAgMzUwIDMzMyA1MDAgNDQ0IDEwMDAgNTAwIDUwMCAzMzMgMTAwMCA1NTYg
MzMzIDg4OSAzNTAgNjExIDM1MCAzNTAgMzMzIDMzMyA0NDQgNDQ0IDM1MCA1MDAgMTAwMCAzMzMg
OTgwIDM4OSAzMzMgNzIyIDM1MCA0NDQgNzIyIDI1MCAzMzMgNTAwIDUwMCA1MDAgNTAwIDIwMCA1
MDAgMzMzIDc2MCAyNzYgNTAwIDU2NCAzMzMgNzYwIDUwMCA0MDAgNTQ5IDMwMCAzMDAgMzMzIDU3
NiA0NTMgMjUwIDMzMyAzMDAgMzEwIDUwMCA3NTAgNzUwIDc1MCA0NDQgNzIyIDcyMiA3MjIgNzIy
IDcyMiA3MjIgODg5IDY2NyA2MTEgNjExIDYxMSA2MTEgMzMzIDMzMyAzMzMgMzMzIDcyMiA3MjIg
NzIyIDcyMiA3MjIgNzIyIDcyMiA1NjQgNzIyIDcyMiA3MjIgNzIyIDcyMiA3MjIgNTU2IDUwMCA0
NDQgNDQ0IDQ0NCA0NDQgNDQ0IDQ0NCA2NjcgNDQ0IDQ0NCA0NDQgNDQ0IDQ0NCAyNzggMjc4IDI3
OCAyNzggNTAwIDUwMCA1MDAgNTAwIDUwMCA1MDAgNTAwIDU0OSA1MDAgNTAwIDUwMCA1MDAgNTAw
IDUwMCA1MDAgNTAwIF0KZW5kb2JqCnhyZWYKMCA5IAowMDAwMDAwMDAwIDY1NTM1IGYgCjAwMDAw
MDAwMTUgMDAwMDAgbiAKMDAwMDAwMDExOSAwMDAwMCBuIAowMDAwMDAwMTg3IDAwMDAwIG4gCjAw
MDAwMDAzNjMgMDAwMDAgbiAKMDAwMDAwMTc1NiAwMDAwMCBuIAowMDAwMDAyMjA1IDAwMDAwIG4g
CjAwMDAwMDI0MDEgMDAwMDAgbiAKMDAwMDAwMjYyNSAwMDAwMCBuIAp0cmFpbGVyCjw8IAogICAv
Um9vdCAxIDAgUgogICAvSW5mbyA1IDAgUgogICAvU2l6ZSA5Cj4+CnN0YXJ0eHJlZgozNjcwCiUl
RU9GCg==
--00000000000060825e05cd360ddb--
