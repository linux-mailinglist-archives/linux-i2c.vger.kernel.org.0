Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB8C014F8EF
	for <lists+linux-i2c@lfdr.de>; Sat,  1 Feb 2020 17:37:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726670AbgBAQhF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 1 Feb 2020 11:37:05 -0500
Received: from sonic316-53.consmr.mail.ne1.yahoo.com ([66.163.187.179]:35447
        "EHLO sonic316-53.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726677AbgBAQhE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 1 Feb 2020 11:37:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1580575023; bh=VxFSqOLnoyhxZXWK73TPGK3hr8yutZ4yWmLQa/jSY/I=; h=Date:From:Reply-To:Subject:References:From:Subject; b=Jhu+rinusv8yrO7P+uj9ivOFAjdRsMBmPFc+4IysZP3e42txtiMOS1Ozpd88qtzPDsY7Ry4DTkeFVzuwutwTvuB2SK6jtwnz+e+CV9LD3b7tXVlbuxj0SQCculj/VDgqZbX27+Ef28W/VMCAjI3bUGhbR7zkObIRB9i/4QSUD75FrSIbePMHMqeYH0iRDH93qV5+vpa8I0KTXt8X1xUbiVcSEgY0ezcs/HZwhRIlytkr3tXmf0Eq0BNrIM51cyXxir8X6vAxWcftEFCuWMjb6fuYtRt8Nr1tFEoqkK23t4nGnEiVBfIUCHOg8aYH/SgqjmQ7qSnALaelCJ5naFT5xg==
X-YMail-OSG: Oiyj.kAVM1n9p7QAwa6TtksRrzjtHbreTj7n.RjcuU6rKCqwcfIKYmMj67_qYGo
 50yTBpoZktKs6JI1busMmYqgFQC4mGzsqhpK5haoVlNENBtDgC8f6a8gtgtF3PZJnmsu5_75HMRJ
 7YA46Jghe4INcyn1h5KO_7aYAscKpbF1P9.m2EZgGU72tjGLT8fimkIpwFKpUnj2earMHE_v2TsQ
 MKxYclls27P5vvmnIMV6FrcEeuIn5_DJLmp_uIQ7oDGxO_P0OVuCbdqTtnp.oskGBxMAaLXYfARC
 4snjv_yE5eAJrwfxkzoB7hrAAYXJozbpASvQf2QZ_UbbbcNJ0JhEzOCUykboiCT64k5af0oehUin
 Twv918CXUpToQeByosgu98y4qNOttRZ1NKp5.mGTFZzXnxYsx9Nt5QpGF.2fhQ9saiFU2.uj6fX1
 fb6swLpUJal48d1jGhfb.XL7IJZ5JQWJoW..NomOUa3Sn8H0lR1E4REfVP33hooYS9inYmNxN9VO
 zODMWKYbM05xw7AM8NYUBQcko5zdCCw.ZIN4GGyZTJ5MjZXTQwee8HfSIZsn5dXJK90FgBUkQDZF
 hfiDy9UgkHyeFXTW.wgINim87rwfdlpPKC9cCePMq6AhzTCR9U5_IhxUVj_oM5OLTAy2BB.wU0kU
 FdtXyxTW9tOMf9ZBC3PGRoiINOUJydKyeov_ZKT5mShpKYiWqyP2NIB1h5wGrYPQm8.NIf4g.3jZ
 hwJe6OvdF8DQSZJneWdcvzRhXbKwWpI_6Fbl_OVTiwy8QAWeGcl9fTpuTtthLNT2GHx30h6fFCT2
 i6NadkPFwW6KGcliefTOTNO03jp_.cOeM4_OFYvsOpY_Ql_xFX_jiMtMjdk5qJdJLnOpXkT971pZ
 rpdK9T6Xbje1MU4FU7PbXhrNDLxv06GO8jQ2VHfHFNXKuzl3wJHjzcsoC8dBSaoIb5FzNPdmJYpU
 bXHnFy1MMsn_UU6lw9IrcYtlFnRUwqAIyVv70EYZVYE4Ti_WVF8IOU9gj2iA4jqdFRNxUlrbeMDK
 XCc.yxjw3lylmFEf85twkP0NJLYKliou8KpJ6bFeLN0wtqeMyPoHvt0kLACIwBKlifIbIpwRXDSY
 Op1MyZfP_EEjDmN5RsrfQ7LI4MsB17EonxqqawHioomWeYVCrSYB1Pa1fmwSLa7ohCQwJ6YNSoMZ
 DYSugR9RYMCoGhmhT0YlZHTQvzfMXhqV6xnn_zOWOiTfbnmKgLZuLzydgbr6LYBWVQke_PaeZA3t
 4vi5C89maj4hpe._H0Zcy8QpEWZ8KWCVHnxqxG2jI_UF1mlmdATy.ATd_8JXmaYVEmGJeCQEvXRF
 FxmjvPVhnxhZEcXpIBqfsP_vNXbXRMV3RWjs-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic316.consmr.mail.ne1.yahoo.com with HTTP; Sat, 1 Feb 2020 16:37:03 +0000
Date:   Sat, 1 Feb 2020 16:35:02 +0000 (UTC)
From:   "Mrs. Maureen Hinckley" <zz13@gczao.com>
Reply-To: maurhinck6@gmail.com
Message-ID: <1187667350.235001.1580574902701@mail.yahoo.com>
Subject: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <1187667350.235001.1580574902701.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.15149 YMailNodin Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36 OPR/66.0.3515.44
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



I am Maureen Hinckley and my foundation is donating (Five hundred and fifty=
 thousand USD) to you. Contact us via my email at (maurhinck6@gmail.com) fo=
r further details.

Best Regards,
Mrs. Maureen Hinckley,
Copyright =C2=A92020 The Maureen Hinckley Foundation All Rights Reserved.
